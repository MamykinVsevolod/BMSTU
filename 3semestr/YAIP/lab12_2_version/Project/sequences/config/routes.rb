Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  match '/input', to: 'sequences#input', via: 'get'
  match '/view', to: 'sequences#view', via: 'get'

  match '/signup', to: 'users#new', via: 'get'
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: 'delete'

  root 'sequences#input'
end
