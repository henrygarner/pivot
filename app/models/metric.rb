class Metric < ActiveRecord::Base
  has_many :facts
  has_many :dimensions
 
  def dimensions_hash
    dimensions.inject(HashWithIndifferentAccess.new) do |hash, dimension|
      dimension_name = dimension.class.to_s.underscore.sub(/_dimension$/, '') 
      hash[dimension_name] = dimension
      hash 
    end  
  end 
         
  def cube(args)     
    
    args = args.split(',') if args.is_a? String
    args = args.inject({}) { |hash, arg| dimension, grain = arg.to_s.split('.'); hash[dimension] = grain; hash } if args.is_a? Array
    cube_dimensions = args.collect do |(dimension_name, grain)| 
       dimension = dimensions_hash[dimension_name] || raise("Unknown dimension: #{dimension_name}")
       dimension.grain = grain if grain
       dimension
     end  
     
     returning((dimensions - cube_dimensions).reject(&:additive?)) do |nonadditive|
       raise("Can't collapse non-additive dimensions: #{ nonadditive.map(&:name).join(', ') }") unless nonadditive.empty?
     end
     # TODO: check for contradictory grain in non-additive dimensions   
     
     fields = cube_dimensions.map { |dimension| "#{dimension.class.table_name}.#{dimension.grain}" }
     group = fields.join ', '
     select = (fields << "SUM(facts.value) value").join ', '
     
     joins = cube_dimensions.map do |dimension|
       dimension_alias = dimension.class.table_name
       string = "JOIN axes #{dimension_alias}_axis ON #{dimension_alias}_axis.fact_id = facts.id"
       string << " JOIN #{dimension_alias} ON #{dimension_alias}_axis.dimension_id = #{dimension_alias}.id"
     end.join ' '
     
     sql = "SELECT #{select} FROM facts #{joins}"
     sql << " WHERE facts.metric_id = #{id}"
     sql << " GROUP BY #{group}" unless group.empty? 
     
    rows = self.class.connection.select_rows sql
    
    hash = {}
    rows.each { |row| hash[row] = row.pop }
 	  Cube.new :data => hash, :dimensions => cube_dimensions
  end 
  
  
end