Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :instances, only: [:create]
  resources :projects do
    resources :instances
  end

  root to: 'static_pages#home'
end
