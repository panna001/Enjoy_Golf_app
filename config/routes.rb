Rails.application.routes.draw do
  root "homes#top"
  get "/about" => "homes#about"
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    resources :relationships, only: [:create, :destroy]
    get "/followings" => "relationships#followings", as: "followings"
    get "/followers" => "relationships#followers", as: "followers"
  end
  resources :rounds, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :notifications, only: [:index]
  delete "/notifications" => "notifications#destroy_all", as: "destroy_all_notifications"
  resources :chats, only: [:show, :create]
end
