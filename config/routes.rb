Rails.application.routes.draw do
  #root to: 'articles#index'
  #resources :articles
  #get 'articles/index'
  #get 'articles/new'
  devise_for :users
  get 'items/index'
  root to: "items#index"
   resources :items, only: [:new, :create, :show, :edit, :update, :destroy] 
end
