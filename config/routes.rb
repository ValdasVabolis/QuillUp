Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'users/posts/:id', to: 'users/posts#show'
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

  # /users/posts    list all their posts
  # /users/posts/new     create new post
end