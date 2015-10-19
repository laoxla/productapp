Rails.application.routes.draw do

  mount Payola::Engine => '/payola', as: :payola
  root 'products#index'
  get 'products/show'

  get "sign_up" => 'users#new', as: :sign_up
  post "sign_up" => 'users#create', as: :users
  get "sign_in" => 'sessions#new', as: :sign_in
  post "sign_in" => 'sessions#create'
  delete "sign_in" => 'sessions#destroy', as: :sign_out

  get "cart" => 'carts#show', as: :shopping_cart
  post "/carts/add/:product_id" => "carts#add", as: :add_to_cart
  delete "/carts/remove/:product_id" => 'carts#remove', as: :remove_from_cart
  get "confirmation/:sale_guid" => 'carts#confirmation', as: :confirmation



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
