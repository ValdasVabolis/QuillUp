Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: 'home#index'

  resources :inquiries, only: [:new, :create]

  # get 'users/question/:id', to: 'users/questions#show'db
  # public profiles
  get 'users/:username', to: 'users#show', as: 'user_profile'
  # private profiles
  get 'account', to: 'accounts#index', as: 'my_account'

  # /users
  namespace :users do
    authenticate :user do
      get 'questions/exit', to: 'questions#exit', as: 'questions_exit'
      resources :questions
      match 'questions/:id/vote/:type', to: 'questions#vote', via: :post
      namespace :questions do
        resources :answers, except: [:new, :show]
        match 'answers/:id/reply', to: 'answers#reply', via: :get
        match 'answers/:id/vote/:type', to: 'answers#vote', via: :post
      end
    end
  end
end