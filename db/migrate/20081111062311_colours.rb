class Colours < ActiveRecord::Migration
  def self.up
    add_column :users, :color, :string
  end

  def self.down
    add_column :users, :color, :string
  end
end
