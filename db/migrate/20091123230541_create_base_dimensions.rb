class CreateBaseDimensions < ActiveRecord::Migration
  def self.up
    create_table :base_dimensions do |t|
      t.string :base
      t.string :connected

      t.timestamps
    end
  end

  def self.down
    drop_table :base_dimensions
  end
end
