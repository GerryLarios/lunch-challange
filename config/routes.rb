Rails.application.routes.draw do
  root 'sessions#new'
  resources :meals
  resources :selections
  resources :sessions, only: [:new, :create]
  get '/logout', to: 'sessions#logout'

  get 'coverage', to: 'coverage#index' if Rails.env.development?
end
