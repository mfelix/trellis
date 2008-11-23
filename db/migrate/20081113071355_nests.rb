class Nests < ActiveRecord::Migration
  def self.up
    add_column :items, :lft, :integer
    add_column :items, :rgt, :integer    
  end

  def self.down
    remove_column :items, :lft, :integer
    remove_column :items, :rgt, :integer
  end
end
