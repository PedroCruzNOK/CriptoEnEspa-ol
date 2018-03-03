Rails.application.routes.draw do
  resources :blog_articles
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', confirmations: 'confirmations' } do 
      delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :application_settings
  resources :alerts
  resources :courses
  resources :abouts
  resources :assistances
  resources :articles

  get 'home/index', to: 'home#index'
  get 'home/my_home', to: 'home#my_home'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
