# frozen_string_literal: true

Rails.application.routes.draw do
  root 'portal/dentists#index'
  namespace :admin do
    root 'notifications#index'
    resources :notifications
    resource :sessions, only: [:new, :create, :destroy]
  end

  namespace :portal do
    resources :dentists
    resources :abouts, only: :index
    resources :director_introducings, only: :index
    resources :facilities, only: :index
  end
end
