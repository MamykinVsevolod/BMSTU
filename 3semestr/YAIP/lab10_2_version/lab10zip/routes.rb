Rails.application.routes.draw do
  get 'sequences_proxy/input'
  get 'sequences_proxy/view'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'sequences_proxy#input'
end
