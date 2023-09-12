# frozen_string_literal: true

Rails.application.routes.draw do
  resources :personals do
    resources :employments
  end

  root 'personals#index'
end
