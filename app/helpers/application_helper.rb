# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def logged_in?
    !current_user.nil?
  end

  def current_view_title(item)
    path_string = link_to NAME+"&nbsp; &rsaquo;", root_url, :class => 'root ancestor'
    
    if item
      # path_string = "<a class='ancestor' href= '" + 'http://localhost:3000' + "'>#{NAME}</a>" 
      if item.child?
        path = item.ancestors
         for p in path
           path_string += "<a class='ancestor' href='" + item_url(p) + "'>" + p.title + "&nbsp; &rsaquo;</a>"
         end
       path_string += "<a class='leaf'>" + item.title + "</a>"
      else
        path_string += "<a class='leaf'>" + item.title + "</a>"
      end
      
    end
    path_string
  end
  
end
