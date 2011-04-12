class CreateQritems < ActiveRecord::Migration
  def self.up
    create_table :qritems do |t|
      t.string :tag
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :qritems
  end
end
