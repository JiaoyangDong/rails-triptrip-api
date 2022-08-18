Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :trips, only: [:show, :index] do
        resources :bookmarks, only: [:create]
      end
      resources :bookmarks, only: [:destroy]
      get 'tags/:tag', to: 'trips#index'
      post 'login', to: 'users#login', as: :login
      get 'attendees/:id', to: 'users#attendee_page'
      get 'admins/:id', to: 'users#admin_page'
    end
      # resources :pets, only: [:show, :index, :create, :update, :destroy] do
        # member do
        #   post 'upload'
        # end
        # resources :bookings, only: [:create]
      # end
      # get 'profile/:id', to: 'users#profile_page'
      # resources :bookings, only: [:show]
  end
end
