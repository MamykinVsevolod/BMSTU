Rails.application.routes.draw do
  resources :results

  get 'db_index', to: 'results#index'
  get 'db_new', to: 'results#new'
  get 'show_all', to: 'results#show_all'

  get 'twins/input'
  get 'twins/view'
  root 'twins#input'
end
