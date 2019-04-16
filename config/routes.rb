Rails.application.routes.draw do

  resources :categories do
    resources :options, except: [:index]
  end


  get 'about' => 'welcome#about'
  root 'welcome#index'
  devise_for :users

end
