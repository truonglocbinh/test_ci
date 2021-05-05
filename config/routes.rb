require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  resources :books
  root to: 'static#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
