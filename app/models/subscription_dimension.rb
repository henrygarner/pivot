class SubscriptionDimension < Dimension
	set_table_name 'subscription_dimensions'
	has_many :axes, :as => :dimension
end
