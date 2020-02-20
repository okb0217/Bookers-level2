Rails.application.routes.draw do
  root 'users#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users, only: [:show, :edit, :update, :index]
  get 'home/about' => 'home#about'
end
