Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :dragons do
    resources :bookings, only: %i[create update]
  end
  resources :bookings, only: %i[index destroy]
end
