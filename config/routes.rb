Rails.application.routes.draw do
  root 'matchings#index'
  get 'auth/:provide/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resource :user
  resource :relationships, only: [:create, :destroy]
  resource :connections, only: [:create, :destroy]
end