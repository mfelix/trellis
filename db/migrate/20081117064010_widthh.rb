class Widthh < ActiveRecord::Migration
  def self.up
    add_column :items, :size, :integer
  end
  def self.down
    remove_column :items, :size, :integer
  end
end
