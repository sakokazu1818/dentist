# frozen_string_literal: true

Rails.application.routes.draw do
  root 'portal/dentists#index'

  namespace :portal do
    resources :dentists
    get '/index2', to: 'dentists#index2'
    get '/index3', to: 'dentists#index3'
    get '/index4', to: 'dentists#index4'
  end
end
