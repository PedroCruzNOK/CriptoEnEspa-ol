Rails.application.routes.draw do
  resources :alerts
  resources :courses
  resources :abouts
  resources :assistances
  resources :articles
  resources:home

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
