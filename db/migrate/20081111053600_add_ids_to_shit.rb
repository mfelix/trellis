class AddIdsToShit < ActiveRecord::Migration
  def self.up
    add_column :items, :user_id, :integer 
    add_column :collections, :user_id, :integer
  end

  def self.down
    remove_column :items, :user_id, :integer 
    remove_column :collections, :user_id, :integer
  end
end
