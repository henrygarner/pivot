class Cube
	attr_reader :data, :dimensions
	
	def initialize(args)
		@data = args[:data]
		@dimensions = args[:dimensions]
	end
	
	def to_h
	  @data_hash ||= @data.inject({}) do |hash, (key, value)|
        hash.deep_merge key.reverse.inject(value) { |value, dimension| { dimension => value } }
 	  end
	end
	
end