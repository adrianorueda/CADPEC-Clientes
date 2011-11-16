ActionController::Routing::Routes.draw do |map|
  map.resources :vendedors
    
  map.resources :especials

  map.root :controller => 'home'       #, :action => 'new' caso queira adicionar uma ação
  
  map.resources :clientes, :has_many => :historicos
  
  map.resources :clientes, :has_many => :agendas
  
  #map.resources :pedidos, :has_many => :clientes, :foreign_key => :cliente_id
  
  map.resources :pedidos, :has_many => :pprods

  map.resources :produtos, :has_many => :pecas

  map.resources :pecas
  
  map.resources :pprods
  
  # tentar isto map.csv_import '/csv/import/:id', :controller => 'pprods', :action => 'csv_import'



  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action'
  map.connect ':controller/:action.:format'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
