class AddLocationToQritems2 < ActiveRecord::Migration
  def self.up
    add_column :locations, :qritem_id, :integer
    add_column :qritems, :location_id, :integer
  end

  def self.down
  end
end
