class BaseDimension < Dimension
  set_table_name 'base_dimensions'
  has_many :axes, :as => :dimension      
end
