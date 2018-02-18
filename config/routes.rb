Rails.application.routes.draw do
  resources :games, only: [:index]

  root 'games#index'
end
