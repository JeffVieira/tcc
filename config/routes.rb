Rails.application.routes.draw do

  resources :notifications do
    collection do
      get :notification
      get :vencimento
      get :checkout
    end
  end

  resources :checkins

  resources :folders

  resources :documents do
    collection do
      get :checkout
      get :validar
      post :validar_create
    end
  end

  #match "documents/get/:id" => "documents#get", :as => "download"

  resources :document_types

  resources :document_processes

  resource :sistem_configurations

  resources :user_groups

  resources :global_searchs
  resources :users do
    collection do
      get :dashboard
      match 'search' => 'users#search', via: [:get, :post], as: :search
    end
  end

  devise_for :users, :path => 'contas', :path_names => { :sign_up => "registrar", :sign_in => "entrar" }, :controllers => { :sessions => 'sessions' }

  root to: "homepages#index"
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
