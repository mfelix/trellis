class Positionsss < ActiveRecord::Migration
  def self.up
    add_column :items, :position, :integer
  end

  def self.down
    remove_column :items, :position, :integer
  end
end
