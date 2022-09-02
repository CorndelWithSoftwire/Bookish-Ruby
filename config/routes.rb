Rails.application.routes.draw do
  devise_for :users
  root to: "books#index"
  get 'books/index'

  resources :books do
    resources :copies, only: %i[new create edit update]
  end

  resources :copies, only: [:destroy]
end
