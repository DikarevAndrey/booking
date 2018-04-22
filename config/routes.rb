Rails.application.routes.draw do
  root 'places#index'
  get 'users/show'
  devise_for :users
  resources :places
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
