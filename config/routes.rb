# frozen_string_literal: true

Rails.application.routes.draw do
  root 'portal/dentists#index'

  namespace :portal do
    resources :dentists
    get '/index2', to: 'dentists#index2'
  end
end
