Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :books, only:[:index, :new, :create, :show, :edit]

  resources :users, only:[:index, :show, :edit, :destroy]
end
