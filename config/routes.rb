MyLearnSpace::Application.routes.draw do
  
  resources :progresses

  resources :exams

  resources :exerciseoverviews

  resources :materialdocuments

  resources :answers

  resources :materials

  resources :materialvideos

  resources :materialpictures

  resources :materiallinks

  resources :materialtexts

  #get '/exercises/:id/exercise_questions', to: 'exercise_questions#new'
          
  root 'welcome#index'

  get "welcome/index"
  
  resources :logins
  
  get 'users/profile' => "users#profile"
  
  post 'users/profile' => "users#profile"
  
  get 'users/adminLogin' => "users#adminLogin"
  
  post 'users/adminLogin' => "users#admin"
  
  get 'users/admin' => "users#admin"
  
  post 'users/admin' => "users#admin"
  
  delete 'users/admin' => "users#adminDelete"

  get 'users/destroy' =>"users#destroy"  
  
  post 'users/destroy' =>"users#destroy"

  
  
  resources :users
  
  
  resources :exercises do 
    
    get 'change_search_style', on: :collection
    get 'search', on: :collection
    get 'statistics', on: :member
    get 'start', on: :member
    get 'finish', on: :member
    
    resources :comments 
    
    resources :performances
    
    resources :subexercises do
      get 'perform', on: :member
      get 'solution', on: :member
    end
    
    resources :likes
    
  end
  
  resources :contents

  resources :questions do
    resources :answers
  end

  resources :curriculums do
    resources :items
  end
  
  post 'curriculums/:id' => "curriculums#update"
  
  get 'curriculums/:curriculum_id/items/:id/addContent' => "items#addContent", as: 'addContent'
  
  post 'curriculums/:curriculum_id/items/:id/addContent' => "items#addContent"
  
  post 'exercises/:id' => "exercises#start"
  
  resources :upload
  
  resources :wikis
  
  post 'wikis/search' => "wikis#search"
  
  get "wikis/searchSuggestions/:search" => "wikis#searchSuggestions"

  resources :knowledge_elements do
    resources :learning_objectives do
      resources :preconditions
    end
  end

  resources :learning_objectives

  resources :preconditions

  resources :topics

  resources :subexercises

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