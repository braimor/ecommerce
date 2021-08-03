Rails.application.routes.draw do
  resources :products
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get "bienvenida", to: "home#index"
  get "perfil", to: "users#edit"

  resources :articles do
    get "/user/:user_id", to: "articles#from_author", on: :collection
  end
  resources :categories
  resources :users, only: [:update]



  #get "articles/new", to: "articles#new", as: :new_articles
  #get "articles/:id", to: "articles#show"
  #get "articles/:id/edit", to: "articles#edit"
  #get "articles", to: "articles#index"

  #patch "articles/:id", to: "articles#update", as: :article
  #post "articles", to: "articles#create"
  #delete "articles/:id", to: "articles#destroy"


end