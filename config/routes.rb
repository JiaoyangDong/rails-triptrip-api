Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :trips, only: [:show, :index, :create, :update, :destroy] do
        resources :bookmarks, only: [:create]
        resources :bookings, only: [:create]
        member do
          post 'upload'
        end
      end
      resources :bookmarks, only: [:destroy]
      resources :bookings, only: [:destroy]

      # customer routes
      get 'tags/:tag', to: 'trips#index'
      post 'login', to: 'users#login', as: :login
      get 'attendees/:id', to: 'users#attendee_page'
      get 'admins/:id', to: 'users#admin_page'
    end
  end
end
