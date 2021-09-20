Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'books/:id', to: 'books#show', constraints: { id: /\d+/ }
  
  resources :authors, only: [:new, :create, :show, :index, :edit, :update, :destroy]

  resources :books, only: [:new, :create, :show, :index, :edit, :update, :destroy]

  get 'books/:topic', to: 'books#topic'

  resources :topics do
    resources :books, only: [:show, :index, :edit, :update, :destroy]
  end
end
