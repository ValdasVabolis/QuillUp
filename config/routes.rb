Rails.application.routes.draw do
  namespace :users do
    resources :posts
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  
  # /users  
  namespace :users do
    authenticate :user do
      resource :posts
    end
  end
  
  # /users/posts    list all their posts
  # /users/posts/new     create new post
  
  
  
  
  
  
end