# frozen_string_literal: true

Rails.application.routes.draw do
  root 'portal/dentists#index'
  namespace :admin do
    root 'notifications#index'
    resources :notifications
  end

  namespace :portal do
    resources :dentists
  end
end
