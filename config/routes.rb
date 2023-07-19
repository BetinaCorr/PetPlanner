Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :pets, only: %i[index show new create edit update destroy] do
    resources :foods, only: %i[index new create]
    resources :allergies, only: %i[show new create]
  end

  resources :foods, only: %i[edit update destroy]
  resources :allergies, only: %i[edit update destroy]

end
