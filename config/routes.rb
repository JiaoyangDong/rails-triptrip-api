Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :trips, only: [:show, :index, :create, :update, :destroy] do
        resources :bookmarks, only: [:create]
        resources :bookings, only: [:create]
        # resources :questions
        post 'survey', to: 'survey#create'
        get 'survey', to: 'survey#show'
        post 'answer', to: 'survey#answer'
        get 'stats', to: 'survey#stats'
        member do
          post 'upload'
          post 'toggle_public'
        end
      end
      resources :bookmarks, only: [:destroy]
      resources :bookings, only: [:destroy]
      resources :users, only: [:update] do
        member do
          post 'upload'
        end
      end
      post 'login', to: 'users#login', as: :login
      get 'attendees/:id', to: 'users#attendee_page'
      get 'admins/:id', to: 'users#admin_page'
      # customer routes
      # get 'tags/:tag', to: 'trips#index'
    end
  end
end
