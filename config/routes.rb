Libapp::Application.routes.draw do
  get '/register', to: 'readers#new', as: 'register'
  get "home/index"
  get '/login', to: 'sessions#new', as: 'login'

  resources :readers
  resources :sessions
  root 'home#index'
end
