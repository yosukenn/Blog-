Rails.application.routes.draw do
  devise_for :users
  root 'blogs#index'
  resources :blogs do
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: :show
end
