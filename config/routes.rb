Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }

  resources :users, only: [:show] do
    resources :collections do
      resources :books
    end
  end

  root to: 'welcome#index'

end
