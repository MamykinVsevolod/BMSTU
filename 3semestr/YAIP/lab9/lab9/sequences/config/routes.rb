Rails.application.routes.draw do
  get 'sequences/input'
  get 'sequences/view'
  root 'sequences#input'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
