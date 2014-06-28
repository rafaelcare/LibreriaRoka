Rails.application.routes.draw do
<<<<<<< HEAD
    
  resources :users
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get 'users/destroy'
  get "signup" => "users#new", :as => "signup"
  get 'users/show'  
  resources :example_orders
  resources :categories
  resources :goal_sales
  resources :order_details  
  resources :orders
  resources :promotions
  resources :providers
  resources :sale_details
  resources :clients do
    collection do
      post :findRFC
      get :findRFC
    end
  end
  resources :products do
    collection do
      post :find
      get :find
    end
  end
  resources :sessions    
=======
  get 'user/index'

  get 'user/show'

  get 'user/new'

  get 'user/create'

  get 'user/edit'

  get 'user/update'

  get 'user/destroy'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :categories

  resources :goal_sales

  resources :order_details

  resources :orders

  resources :promotions

  resources :providers

  resources :sale_details

  resources :clients

  resources :products
>>>>>>> a85857b70e0ab3c5ee42c62102cd2bf50984ba25

  resources :sales

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
<<<<<<< HEAD
  root 'sales#index'
=======
  # root 'welcome#index'
>>>>>>> a85857b70e0ab3c5ee42c62102cd2bf50984ba25

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
