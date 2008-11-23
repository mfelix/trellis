# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def logged_in?
    !current_user.nil?
  end

  def current_view_title(item)
    if item
      path_string = "<a class='ancestor' href= '" + 'http://localhost:3000' + "'>root</a>" 
      if item.child?
        path = item.ancestors
         for p in path
           path_string += "<a class='ancestor' href='" + item_url(p) + "'>" + p.title + "</a>"
         end
       path_string += item.title
      else
        path_string += item.title
      end
      path_string
    end
  end
  
end
