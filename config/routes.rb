Rails.application.routes.draw do

  resources :login

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  mount GrapeSwaggerRails::Engine, at: "/doc"

  resources :grammar_questions

  resources :grammar_groups

  resources :live_broadcasts

  resources :lb_comments

  resources :broadcast_sets

  resources :recorded_broadcasts

  resources :questions

  root :to => 'assets#index'
  get 'assets/index'

  namespace :v1, defaults: {format: 'json'} do
    resources :grammar_results

    resources :vocabulary_results

    resources :pcl_answers

    resources :article_marks

    resources :opinions

    resources :discussions do
      resources :opinions
    end

    resources :tasks do
      resources :opinions
    end

    resources :users do
      post 'login', on: :collection
      post 'verify_open_id', on: :collection
      post 'verify_captcha', on: :collection
    end
    resources :questions

    resources :tasks do
      get 'task_top', on: :collection
    end
    resources :broadcast_sets do
      get 'count', on: :member
    end
    resources :recorded_broadcasts do
      get 'count', on: :member
    end
    resources :rb_favorites
    resources :rb_comments
    resources :live_broadcasts do
      resources :lb_comments
    end
    resources :marks
    resources :judgements
    resources :add_questions
    resources :home_page, only: [] do
      get 'hot_exercises', on: :collection
    end
  end

  mount API::Base, at: "/"




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
