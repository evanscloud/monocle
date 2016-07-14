Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }

  resources :books, only: [:index, :create, :show]

  resources :collections do
    resources :books, only: [:show, :update, :destroy]
    resources :comments
  end
  resources :users do
    resources :collections
  end

  root to: 'welcome#index'

end
