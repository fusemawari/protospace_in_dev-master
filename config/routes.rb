Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :prototypes do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy, :edit, :update]
  end
  resources :users, only: [:index, :show, :edit, :update]
  resources :tags, only: [:index, :show]
end
