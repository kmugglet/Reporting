ActionController::Routing::Routes.draw do |map|
  map.resources :milestone_imports


  map.site 'sites/show/:id', :controller => 'sites', :action => 'show'
  map.site 'sites/edit/:id', :controller => 'sites', :action => 'edit'
  map.resources :sites

  map.resources :imports

  map.resources :user_reports

  map.admin 'reports/chart', :controller => "reports", :action => 'chart'
  map.resources :reports

  map.admin 'admin/jvo_page', :controller => "admin", :action => 'jvo_page'
  map.admin 'admin/login', :controller => "admin", :action => 'login'
  map.admin 'admin/logout', :controller => "admin", :action => 'logout'
  map.resources :admin

  map.resources :transmission_date

  map.spin 'spins/edit/:id', :controller => 'spins', :action => 'edit'
#  map.spin 'spins/update/:id', :controller => 'spins', :action => 'update'
  map.spin 'spins/create_spin/', :controller => 'spins', :action => 'create_spin'
#  map.spin 'spins/create/', :controller => 'spins', :action => 'create_spin'
#  map.spin 'spins/cancel/:id', :controller => 'spins', :action => 'cancel'
#  map.spin 'spins/lead/:id', :controller => 'spins', :action => 'lead'
#  map.spin 'spins/other/:id', :controller => 'spins', :action => 'other'
#  map.spin 'spins/jvo/:id', :controller => 'spins', :action => 'jvo'
#  map.spin 'spins/add_to_msl/:id', :controller => 'spins', :action => 'add_to_msl'
#  map.spin 'spins/export_spin_form/:id', :controller => 'spins', :action => 'export_spin_form'
  map.resources :spins

  map.resources :documents

  map.spin 'sites/show/:id', :controller => 'sites', :action => 'show'
  map.resources :sites

  map.resources :users

  map.root :controller => "admin"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
