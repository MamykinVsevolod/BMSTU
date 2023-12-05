Rails.application.routes.draw do
  get 'sequences/calculate'
  root 'sequences#calculate'
end
