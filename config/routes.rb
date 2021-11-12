Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  
  resources :stories

  get 'contact' => 'contact#contact'

  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  get '/login' => 'sessions#login'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy'
end
