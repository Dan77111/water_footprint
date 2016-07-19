Rails.application.routes.draw do
  devise_for :users, :skip => [:sessions, :registrations]
  as :user do
    get 'login' => 'devise/sessions#new', :as => :login
    post 'login' => 'devise/sessions#create'
    delete 'logout' => 'devise/sessions#destroy', :as => :logout

    get 'signup' => 'devise/registrations#new', :as => :signup
    post 'signup' => 'devise/registrations#create'
  end

  root 'static_pages#home'

  get '/info' => 'static_pages#info'
  get '/calculator' => 'static_pages#calculator'
  post '/temp' => 'static_pages#temp_result'

  # get '/signup' => 'users#new'
  # post '/users' => 'users#create'

  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'
  # get '/logout' => 'sessions#destroy'

  resources :users, only: [:get, :post] do
    get '/results', to: 'results#index'
    post '/results', to: 'results#create'

    # member do
    #   get :confirm_email
    #   get :delete_email
    # end
  end



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
