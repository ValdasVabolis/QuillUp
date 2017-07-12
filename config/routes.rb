Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  # /users
  namespace :users do
    authenticate :user do
      resources :posts
      match 'posts/:id/vote/:type', to: 'posts#vote', via: :post
      namespace :posts do
        resources :comments
      end
    end
  end

  # /users/posts    list all their posts
  # /users/posts/new     create new post
end