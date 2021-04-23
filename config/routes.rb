Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: "items#index"
   resources :items, only: [:new, :create, :show, :edit, :update, :destroy] 
   resources :users, only: [:new, :create, :show, :edit, :update, :destroy] 
   resources :sessions, only: [:new, :create, :show, :update] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
