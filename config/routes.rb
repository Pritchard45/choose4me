Rails.application.routes.draw do


  get 'users/show'
  devise_for :users
  resources :users, only: [:show]

  resources :users, only: [] do
      resources :categories, only: [:show]

  end
  resources :categories do
    resources :options, except: [:index]
  end

  resources :categories, only: [] do
    resources :favorites, only: [:index, :create, :destroy]
  end

  resources :options, only: [] do
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  get 'about' => 'welcome#about'
  root 'welcome#index'


end
