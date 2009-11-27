class CreateDateDimensions < ActiveRecord::Migration
  def self.up
    create_table :date_dimensions do |t|
      t.string :day
      t.string :month
      t.string :year
      t.timestamps
    end
  end

  def self.down
    drop_table :date_dimensions
  end
end
