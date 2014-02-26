MyLearnSpace::Application.routes.draw do
      
  root 'welcome#index'

  get "welcome/index"
   
  
  
  resources :logins
  
  get 'users/profile' => "users#profile"
  
  post 'users/profile' => "users#profile"
  
  get 'users/adminLogin' => "users#adminLogin"
  
  post 'users/adminLogin' => "users#adminLogin"
  
  get 'users/admin' => "users#admin"
  
  post 'users/admin' => "users#admin"

  get 'users/destroy' =>"users#destroy"  
  
  post 'users/destroy' =>"users#destroy"

  resources :users
  
  
  
  
  resources :items

  resources :contents

  resources :questions do
    resources :answers
  end

  resources :curriculums do
    resources :items
  end
  
  post 'curriculums/:id' => "curriculums#update"
  
  resources :upload
  
  resources :wikis
  
  post 'wikis/search' => "wikis#search"
  
  get "wikis/searchSuggestions/:search" => "wikis#searchSuggestions"
  
  
 

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
