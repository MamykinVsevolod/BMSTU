Rails.application.routes.draw do
  get 'sequences/calculate'
  root 'sequences#calculate'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
