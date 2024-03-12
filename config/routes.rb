Rails.application.routes.draw do
  devise_for :users

  get "profile", to: "pages#profile"

  root to: "cons#index"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :cons do #index/show/new/create/edit/update/destroy
    resources :bookings, only: [:new, :create]
  end
  patch "accept", to: "bookings#accept"
  patch "refuse", to: "bookings#refuse"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
