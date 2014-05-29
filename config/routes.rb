Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :projects do
    resources :instances
  end

  root to: 'static_pages#home'
end
