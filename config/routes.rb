Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  resources :books, only: [:new, :create, :index, :show, :edit]
  resources :users, only: [:show, :edit]
  get 'homes/top'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
