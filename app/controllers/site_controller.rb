class SiteController < ApplicationController

  def index
    @roots = Item.roots#User.find(current_user).items.roots.sort_by(&:updated_at).reverse
  end


end