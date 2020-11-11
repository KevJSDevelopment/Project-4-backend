Rails.application.routes.draw do
  resources :channels, only: [:index, :create, :show]
  resources :messages, only: [:create]
  resources :users, only: [:update, :create]

  get "/login/user", to: "users#show"
  post "/login/:username", to: "users#login"
  
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
