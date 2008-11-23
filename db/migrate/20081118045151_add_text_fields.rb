class AddTextFields < ActiveRecord::Migration
  def self.up
    add_column :items, :text, :text
  end

  def self.down
    remove_column :items, :text, :text
  end
end
