Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  root "groups#index"

  resources :groups, only: [:index, :new, :create] do
    resources :records, only: [:index, :new, :create]
  end

  get '/user', to: 'user#index'

  get '/fronts', to: 'fronts#index'

  resources :logs, only: [:index]

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
