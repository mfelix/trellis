ActionController::Routing::Routes.draw do |map|
  
  map.resources :collections
  map.resources :items
  
  map.root :controller => 'site'

  #restful authentication stuff
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil  
  map.resources :users, :member => { :suspend => :put, :unsuspend => :put, :purge => :delete }

  map.resource :session
 
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
