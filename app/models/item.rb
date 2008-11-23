class Item < ActiveRecord::Base

  # acts_as_list

  belongs_to :collection
  belongs_to :user
  
  has_attached_file :image
  has_attached_file :audio
  
  acts_as_nested_set
  
end