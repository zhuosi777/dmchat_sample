Rails.application.routes.draw do
  root 'tops#index'
  devise_for :shops
  devise_for :users
  resources :rooms, only: [:show, :create] do
    resources :messages, only: [:create]
end
