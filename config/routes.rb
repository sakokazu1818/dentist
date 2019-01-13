Rails.application.routes.draw do
  root  'dentists#index'

  resources :dentists
end
