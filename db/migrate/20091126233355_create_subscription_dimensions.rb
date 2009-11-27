class CreateSubscriptionDimensions < ActiveRecord::Migration
  def self.up
    create_table :subscription_dimensions do |t|
      t.string :subscription
	  t.string :tv
	  t.string :replay
	  t.string :kids
	  t.string :music
	  t.string :value_pack
      t.timestamps
    end
  end

  def self.down
    drop_table :subscription_dimensions
  end
end
