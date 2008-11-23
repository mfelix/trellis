class CreateObjects < ActiveRecord::Migration
  def self.up
    create_table :objects do |t|
      t.column :title,        :string, :limit => 40
      t.column :content,      :string, :limit => 1.megabyte
      t.column :created_at,   :datetime
      t.column :updated_at,   :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :objects
  end
end
