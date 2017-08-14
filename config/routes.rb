Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: 'home#index'

  resources :inquiries, only: [:new, :create]

  # get 'users/question/:id', to: 'users/questions#show'db
  # public profiles
  get 'users/:username', to: 'users#index', as: 'user_profile'
  get 'users/:username/profile', to: 'users#profile'
  get 'users/:username/questions', to: 'users#questions'
  get 'users/:username/answers', to: 'users#answers'
  # private profiles
  devise_scope :user do
    get 'account', to: redirect('/account/profile'), as: :my_account
    get 'account/profile', to: 'accounts#profile'
    get 'account/settings', to: 'users/registrations#edit'
    get 'account/questions', to: 'accounts#questions'
    get 'account/answers', to: 'accounts#answers'
  end

  # /users
  namespace :users do 
    get 'questions/:id', to: 'questions#show', constraints: { id: /\d*/ }
    authenticate :user do
      get 'questions/exit', to: 'questions#exit', as: 'questions_exit'
      resources :questions, except: [:show]
      match 'question/:id/vote/:type', to: 'questions#vote', via: :put
      namespace :questions do
        resources :answers, except: [:new, :show]
        match 'answers/:id/reply', to: 'comments#create', via: :post, as: 'answer_replies'
        match 'answer/:id/vote/:type', to: 'answers#vote', via: :put
      end
    end
  end
end