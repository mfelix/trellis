class AddFieldz < ActiveRecord::Migration
  def self.up
    add_column :items, :audio_attachment_embed, :text
  end

  def self.down
    remove_column :items, :audio_attachment_embed, :text
  end
end
