Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  resources :users, only: [:index, :show, :edit, :update] do
    resources :prototypes
  end
  resources :prototypes do
    resources :likes, only: [:create, :destroy]
  end
end
