class Bubs < ActiveRecord::Migration
  def self.up
    add_column :items, :collection_id, :integer 
  end

  def self.down
    remove_column :items, :collection_id, :integer 
  end
end
