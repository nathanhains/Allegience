Rails.application.routes.draw do
  resources :users do
    get :allegience
  end
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/roster', to: 'characters#index'
  get '/selection', to: 'characters#create'

  root 'application#home'

  resources :jobs
  resources :civilian_factions do
    get :requests
    get :accept
  end

end
