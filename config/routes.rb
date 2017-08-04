Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: 'home#index'

  resources :inquiries, only: [:new, :create]

  # get 'users/post/:id', to: 'users/posts#show'db
  # public profiles
  get 'users/:username', to: 'users#show', as: 'user_profile'
  # private profiles
  get 'account', to: 'accounts#index', as: 'my_account'

  # /users
  namespace :users do
    authenticate :user do
      get 'posts/exit', to: 'posts#exit', as: 'posts_exit'
      resources :posts
      match 'posts/:id/vote/:type', to: 'posts#vote', via: :post
      namespace :posts do
        resources :comments, except: [:new, :show]
        match 'comments/:id/reply', to: 'comments#reply', via: :get
        match 'comments/:id/vote/:type', to: 'comments#vote', via: :post
      end
    end
  end
end