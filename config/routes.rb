Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :session, only: [:new, :create, :delete]
end
