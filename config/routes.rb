Rails.application.routes.draw do
  get 'accounts/index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'users/post/:id', to: 'users/posts#show'
  get 'users/:username', to: 'accounts#show', as: 'user_profile'
  # /users
  namespace :users do
    authenticate :user do
      resources :posts, except: [:show]
      match 'posts/:id/vote/:type', to: 'posts#vote', via: :post
      namespace :posts do
        resources :comments
        match ':post_id/comments/:comment_id/vote/:type', to: 'comments#vote', via: :post
      end
    end
  end
end