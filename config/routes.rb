Rails.application.routes.draw do

  resources :categories
  resources :options


  get 'about' => 'welcome#about'
  root 'welcome#index'
  devise_for :users

end
