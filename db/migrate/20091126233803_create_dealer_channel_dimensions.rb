class CreateDealerChannelDimensions < ActiveRecord::Migration
  def self.up
    create_table :dealer_channel_dimensions do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :dealer_channel_dimensions
  end
end
