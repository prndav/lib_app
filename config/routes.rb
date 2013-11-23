Libapp::Application.routes.draw do
  resources :books
  get '/register', to: 'readers#new', as: 'register'
  get "home/index"
  get '/login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :readers
  resources :sessions
  root 'home#index'
end
