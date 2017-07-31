Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  # get 'users/post/:id', to: 'users/posts#show'
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
        resources :comments
        match 'comments/:id/vote/:type', to: 'comments#vote', via: :post
      end
    end
  end
end