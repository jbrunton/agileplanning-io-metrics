Rails.application.routes.draw do
  root 'home#index'
  get 'try', to: 'home#try'
  get 'profile', to: 'users#profile'

  devise_for :users
  resources :users

  resources :organizations, except: [:index] do
    resources :survey_templates, shallow: true do
      get 'trends(/:team_id)', action: 'trends', as: 'trends', on: :member

      resources :survey_questions, shallow: true, only: [:create, :update, :destroy]

      resources :surveys, shallow: true do
        resources :survey_responses, shallow: true, only: [:index, :new, :create] do
          get 'team/:team_id', action: 'team', as: 'team', on: :collection
          get 'thankyou', on: :collection
        end
      end
    end

    resources :teams, shallow: true do
      member do
        delete 'remove_member/:user_id', action: 'remove_member', as: 'remove_member_from'
        delete 'remove_admin/:user_id', action: 'remove_admin', as: 'remove_admin_from'
        post 'add_user', as: 'add_user_to'
      end
    end
  end

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
