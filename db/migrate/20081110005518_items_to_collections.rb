class ItemsToCollections < ActiveRecord::Migration
  def self.up
    add_column :items, :parent, :integer 
  end

  def self.down
    remove_column :items, :parent, :integer
  end
end
