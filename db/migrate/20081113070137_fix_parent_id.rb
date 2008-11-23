class FixParentId < ActiveRecord::Migration
  def self.up
    rename_column :items, :parent, :parent_id
  end

  def self.down
    rename_column :items, :parent_id, :parent
  end
end
