Rails.application.routes.draw do
  resources :users do
    resources :jobs
    get :allegience
  end

  resources :jobs
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  get '/roster', to: 'characters#index'
  get '/selection', to: 'characters#create'

  root 'application#home'

  
  resources :civilian_factions do
    get :requests
    get :accept
  end

  resources :heroization_factions do
    get :requests
    get :accept
  end

  resources :villainization_factions do
    get :requests
    get :accept
  end

  resources :comments

end
