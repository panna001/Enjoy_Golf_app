Rails.application.routes.draw do
  devise_for :users
  root "homes#top"
  get "/about" => "homes#about"
  resources :users, only: [:show, :edit, :update] do
    resources :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end
  resources :rounds, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
    resource :favorites, only: [:create, :destroy]
    resource :bookmarks, only: [:create, :destroy]
    collection do
      get :bookmarks 
    end
  end
  resources :notifications, only: [:index]
  delete "/notifications" => "notifications#destroy_all", as: "destroy_all_notifications"
  resources :chats, only: [:show, :create]
end

