Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "/up", to: "health#up"

  root to: "home#index"
  get "about", to: "pages#about"
  # Defines the root path route ("/")
  # root "posts#index"
end
