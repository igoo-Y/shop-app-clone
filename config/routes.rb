Rails.application.routes.draw do
  get 'orders/create'
  get 'orders/show'
  get 'carts/create'
  devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  resources :packs, only: [:index, :show]

  resources :carts, only: [:index, :create, :destroy]

  resources :orders, only: [:create, :show, :index]

  get "mypage" => "home#mypage"

  # get 'packs/index'
  # get 'packs/show/:id' => "packs#show"

  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
