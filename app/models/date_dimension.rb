class DateDimension < Dimension
  set_table_name 'date_dimensions'
  has_many :axes, :as => :dimension
end
