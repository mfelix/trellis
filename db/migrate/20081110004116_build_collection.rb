class BuildCollection < ActiveRecord::Migration
  def self.up
    add_column :collections, :title, :string
  end

  def self.down
    remove_column :collections, :title, :string
  end
end
