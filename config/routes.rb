Rails.application.routes.draw do
  resources :missions, only: %i[create]
  resources :planets, only: %i[index]
  resources :scientists # , only: %i[index show create update destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
