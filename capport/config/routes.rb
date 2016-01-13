Rails.application.routes.draw do
  get 'page/check'

  get 'page/result'

  ##http://localhost:3000/users/indexにリダイレクト
  #root to : redirect('/users')
  
  get 'users/index'
  root 'users#index'

  get 'users/show'

  #一時的に消す devise_for :users
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks" 
    
    }
  #rooting 
  match "/check", to: "page#check", via: "get"
  match "/result", to: "page#result", via: "get"  

  #user check
  #match "/result", to: "page#result", via: "get"
  #match "/check", to: "page#check", via: "get"
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
