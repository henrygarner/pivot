class CreateAxes < ActiveRecord::Migration
  def self.up
    create_table :axes do |t|
      t.integer :fact_id
      t.integer :dimension_id
      t.string :dimension_type

      t.timestamps
    end
  end

  def self.down
    drop_table :axes
  end
end
