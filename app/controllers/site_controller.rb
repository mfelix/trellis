class SiteController < ApplicationController

  def index
    @roots = User.find(1).items.roots
  end


end