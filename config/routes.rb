BookClub::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.
  get "home/index"
  root :to => "home#index"

  match "/auth/google_oauth2/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
  match "/book/:isbn" => "home#book"

  resources :clubs

  get '/all', :to => 'clubs#index', :as => 'all'

  resources :users

  get '/all', :to => 'users#index', :as => 'all'

  resources :memberships

  get '/all', :to => 'memberships#index', :as => 'all'

  resources :ratings

  get '/all', :to => 'ratings#index', :as => 'all'

# perma bottom link foo
  match "/:search"  => "home#search"
  # /b/:title => book page
  # /@/:user => user page
  # /c/:name => club page


  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
