Libapp::Application.routes.draw do

  get "home/index"
  get '/register', to: 'readers#new', as: 'register'

  resources :readers
  root 'home#index'
end
