class CreateDimensions < ActiveRecord::Migration
  def self.up
    create_table :dimensions do |t|
      t.integer :metric_id
      t.string :type
      t.string :grain
      t.boolean :additive

      t.timestamps
    end
  end

  def self.down
    drop_table :dimensions
  end
end
