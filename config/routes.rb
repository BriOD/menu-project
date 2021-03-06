Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get 'welcome/home'

  root 'welcome#home'

  resources :categories
  resources :menus
  resources :items do
    resources :reviews
  end

  resources :users, only: [:show] do
    resources :reviews, only: [:show, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
