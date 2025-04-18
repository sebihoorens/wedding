# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope '/:locale' do
    get 'welcome/index'

    get 'travel-and-stay', to: 'travel#index'
    get 'exploring-ecuador', to: 'exploring#index'
    get 'our-story', to: 'story#index'
    get 'faq', to: 'faq#index'

    resources :guests do
      resources :plus_ones
      member do
        get :confirm
        patch :complete
      end
    end

    root 'welcome#index', as: :welcome_root
  end

  root to: 'welcome#index'
end
