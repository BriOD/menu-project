Rails.application.routes.draw do

  devise_for :users
  get 'welcome/home'

  root 'menus#index'

  resources :categories
  resources :menus
  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
