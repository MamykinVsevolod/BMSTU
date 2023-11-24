Rails.application.routes.draw do
  get 'rk2/input'
  get 'rk2/view'
  root 'rk2#input'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
