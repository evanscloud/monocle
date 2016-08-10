Rails.application.routes.draw do

  resources :comments
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }

  resources :users, only: [:show], shallow: true do
    resources :collections do
      resources :books
      resources :comments
    end
  end

  resources :collections, only: [:index]

  root to: 'welcome#index'

end
