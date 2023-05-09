Rails.application.routes.draw do

  devise_for :users

  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follows', as: 'follows'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  get 'search' => 'searches#search'
  
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
