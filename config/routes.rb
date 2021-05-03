Rails.application.routes.draw do
  #root to: 'articles#index'
  #resources :articles
  #get 'articles/index'
  #get 'articles/new'
  devise_for :users
  get 'items/index'
  post 'items/new'
  root to: "items#index"
   resources :items, only: [:index, :show, :new, :create, :show, :edit, :update, :destroy] 
end
