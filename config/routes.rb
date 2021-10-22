Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "restaurants/new", to: "restaurants#new" # The `new` route
  post "restaurants", to: "restaurants#create"

  get 'restaurants', to: 'restaurants#index'
  get 'restaurants/:id', to: 'restaurants#show', as: :restaurant

  get "restaurants/:id/edit", to: "restaurants#edit", as: :restaurant_edit
  patch 'restaurants/:id', to: 'restaurants#update'

  delete "restaurants/:id", to: "restaurants#destroy"

  # /restaurants/restaurant_id/reviews
  resources :restaurants, except: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :reviews, only: [ :new, :create ]
  end

end
