Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
  get '/profile', to: 'users#show'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'
  root 'application#home'

  resources :jobs

end
