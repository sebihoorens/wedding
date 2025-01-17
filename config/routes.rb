# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/:locale' do
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)

    get 'welcome/index'

    resources :guests do
      resources :plus_ones
      member do
        get :confirm
        patch :complete
      end
    end

    root 'welcome#index'
  end
end
