Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root :to => "homes#top"
  get "home/about" => "homes#about"

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update]
  resources :users, only: [:index, :show, :edit, :update]

  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
end
