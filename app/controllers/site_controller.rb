class SiteController < ApplicationController

  def index
    @roots = current_user.items.roots
    
    @user_items = Item.find_all_by_user_id(current_user.id)
  end


end