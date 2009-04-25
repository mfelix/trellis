class AddUserRoot < ActiveRecord::Migration
  def self.up
    add_column :users, :origin, :integer
  end

  def self.down
    remove_column :users, :origin, :integer
  end
end