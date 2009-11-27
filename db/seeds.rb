# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

#metric = Metric.create :name => 'Customer base by date'
#{DateDimension => 'day', BaseDimension => 'base'}.each do |klass, grain|
#  returning(metric.dimensions.build :additive => (klass == DateDimension), :grain => grain) { |dimension| dimension.type = klass.to_s }.save
#end
#(1.year.ago.to_date..Date.today).each do |date|
#   date_dimension = DateDimension.create :day => date.strftime('%d %b %y'), :month => date.strftime('%B %Y')
#   ['Pre-Customer','Non-Connected','Connected'].each do |base|
#      base_dimension = BaseDimension.create :base => "#{base} Base", :connected => (base=='Connected' ? 'Connected' : 'Non-Connected')
#      returning(metric.facts.create :value => rand(100000)) do |fact|
#        [date_dimension,base_dimension].each { |dimension| fact.axes.create :dimension => dimension }
#      end
#   end
#end

def all_combinations(arrays)
	last = arrays.pop.to_a
	arrays.reverse.inject(last) do |cartesian, array|
		cartesian.product array
	end.collect(&:flatten)
end

metric = Metric.create :name => 'Sales by subscription & dealer channel'

{DateDimension => 'day', SubscriptionDimension => 'subscription', DealerChannelDimension => 'name'}.each do |klass, grain|
  returning(metric.dimensions.build :additive => true, :grain => grain) { |dimension| dimension.type = klass.to_s }.save
end

(1.year.ago.to_date..Date.today).each do |date|
   DateDimension.create :day => date.strftime('%d %b %y'), :month => date.strftime('%B %Y'), :year => date.strftime('%Y')
end

['Inbound', 'Outbound', 'BT.com'].each do |dealer_channel|
	DealerChannelDimension.create :name => dealer_channel
end

(0..15).each do |subscription|
	SubscriptionDimension.create :subscription => (subscription == 0 ? 'No Subscription' : 'Subscription'),
      	  :tv => (subscription & 1 > 0 ? 'TV Subscription' : 'No TV Subscription'),
      	  :replay => (subscription & 2 > 0 ? 'Replay Subscription' : 'No Replay Subscription'),
      	  :kids => (subscription & 4 > 0 ? 'Kids Subscription' : 'No Kids Subscription'),
      	  :music => (subscription & 8 > 0 ? 'Music Subscription' : 'No Music Subscription'),
      	  :value_pack => (subscription == 15 ? 'Value Pack' : 'No Value Pack')
end

all_combinations([DateDimension, DealerChannelDimension, SubscriptionDimension].collect { |klass| klass.all }).each do |dimensions|
	returning(metric.facts.create :value => rand(25)) do |fact|
    	dimensions.each { |dimension| fact.axes.create :dimension => dimension }
	end	
end
