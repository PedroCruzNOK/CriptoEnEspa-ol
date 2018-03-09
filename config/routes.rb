Rails.application.routes.draw do
  mount ActionCable.server => "/cable"

  get 'management/index'
  scope '/management' do
    resources :users
    resources :courses do 
      resources :lessons
    end
  end

  resources :courses

  get 'chat/index'

  get 'users/my_account'
  get 'users/edit'
  get 'users/edit_password'

  resources :privacy_policies do
    collection do
      get 'last'
    end
  end
  resources :blog_articles
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', confirmations: 'confirmations' } do

      delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resource :user, only: [:edit_password, :edit] do
    collection do
      patch 'update_password'
      patch 'update'
    end
  end

  resources :application_settings
  resources :alerts
  resources :abouts
  resources :assistances
  resources :articles
  resources :rooms

  get 'home/index', to: 'home#index'
  get 'home/my_home', to: 'home#my_home'
  get 'home/dashboard', to: 'home#dashboard'
  
  get 'rooms/show', to: 'rooms#show'

  root 'home#index'
  
  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
