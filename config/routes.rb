Rails.application.routes.draw do
  get 'management/index'
  scope '/management' do
    resources :users
    resources :courses
  end

  get 'chat/index'

  get 'users/my_account'
  get 'users/edit'
  get 'users/edit_password'

  resources :conversations, only: [:create]do
    member do
      post :close
      resources :messages, only: [:create]
    end
  end

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
  resources :chat

  get 'home/index', to: 'home#index'
  get 'home/my_home', to: 'home#my_home'
  get 'home/dashboard', to: 'home#dashboard'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
