Rails.application.routes.draw do
  root 'meals#index'
  resources :meals
  resources :selections
end
