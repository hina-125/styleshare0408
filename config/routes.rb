Rails.application.routes.draw do
  # root to: 'posts#index'を下記に変更
  root to: 'toppages#index'
  
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create]
  
  resources :posts, only: [:create, :destroy]
end
