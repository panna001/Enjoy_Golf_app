Rails.application.routes.draw do
  devise_for :users
  root "homes#top"
  get "/about" => "homes#about"
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
    resources :rounds, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  get "/all" => "posts#all"
  resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
    resource :favorites, only: [:create, :destroy]
    resource :bookmarks, only: [:create, :destroy]
    get :bookmarks, on: :collection
  end
  resources :notifications, only: [:index]
  delete "/notifications" => "notifications#destroy_all", as: "destroy_all_notifications"
  resources :chats, only: [:show, :create]
end

