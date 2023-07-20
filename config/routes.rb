Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :pets, only: %i[index show new create edit update destroy] do
    resources :foods, only: %i[index new create]
    resources :allergies, only: %i[index new create]
    resources :professionals, only: %i[index new create]
    resources :diseases, only: %i[index new create]
    resources :medications, only: %i[index new create]
    resources :vaccines, only: %i[index new create]
    resources :services, only: %i[index]
  end

  resources :foods, only: %i[edit update destroy]
  resources :allergies, only: %i[edit update destroy]
  resources :services, only: %i[edit update destroy]
  resources :diseases, only: %i[edit update destroy]
  resources :medications, only: %i[edit update destroy]
  resources :vaccines, only: %i[edit update destroy]
  resources :professional, only: %i[edit update destroy] do
    resources :services, only: %i[new create]
  end

end
