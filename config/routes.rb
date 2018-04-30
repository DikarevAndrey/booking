Rails.application.routes.draw do
  get 'offer/new'

  get 'offer/edit'

  get 'admin/add'

  get 'admin/edit'

  get 'admin/bookings'

  get 'admin/home'

  root 'places#index'
  get 'users/show'
  devise_for :users
  resources :places
  resources :users
  resources :offers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
