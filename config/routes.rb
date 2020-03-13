Rails.application.routes.draw do
  root 'meals#index'
  resources :meals
  resources :selections
  get 'coverage', to:'coverage#index' if Rails.env.development?
end
