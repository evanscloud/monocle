Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }

  resources :users, only: [:show], shallow: true do
    resources :collections do
      resources :books
    end
  end

  get 'books/search', to: "books#search", as: :search
  
  resources :collections, only: [:index]

  root to: 'welcome#index'

end
