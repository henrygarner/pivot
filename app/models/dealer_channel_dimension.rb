class DealerChannelDimension < Dimension
  set_table_name 'dealer_channel_dimensions'
  has_many :axes, :as => :dimension
end
