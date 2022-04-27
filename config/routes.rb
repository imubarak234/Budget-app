Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  root "groups#index"

  resources :groups do
    resources :records
  end

  get '/user', to: 'user#index'

  resources :logs

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
