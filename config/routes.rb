Rails.application.routes.draw do


  devise_for :users
  resources :categories do
    resources :options, except: [:index]
  end

  resources :categories, only: [] do
    resources :favorites, only: [:create, :destroy]
  end

  resources :options, only: [] do
    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end

  get 'about' => 'welcome#about'
  root 'welcome#index'


end
