# frozen_string_literal: true

Rails.application.routes.draw do
  root 'portal/dentists#index'

  namespace :portal do
    resources :dentists
  end
end
