Rails.application.routes.draw do
  devise_for :users

  get "profile", to: "pages#profile"

  root to: "cons#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :cons do
    resources :bookings, only: [:create]
  end
  patch "bookings/:id/accept", to: "bookings#accept", as: "accept"
  patch "bookings/:id/refuse", to: "bookings#refuse", as: "refuse"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
