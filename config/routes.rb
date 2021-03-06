Rails.application.routes.draw do
  root 'places#index'
  
  post 'places/new_review' 

  get 'recomendation/show'

  get 'search/list'

  get 'offer/new'

  get 'offer/edit'

  get 'admin/add'

  get 'admin/edit'

  get 'admin/bookings'

  get 'admin/home'

  get 'search/list'

  get 'users/show'

  devise_for :users
  resources :places
  resources :users
  resources :offers 
  resources :orders
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
