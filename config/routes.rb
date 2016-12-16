Rails.application.routes.draw do

  root 'menus#index'
  resources :categories
  resources :menus
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
