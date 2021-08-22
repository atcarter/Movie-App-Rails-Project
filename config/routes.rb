Rails.application.routes.draw do
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/movies/year_asc', to: 'movies#year_asc'
  get '/movies/year_desc', to: 'movies#year_desc'

  # sort movies abc and zyx
  get '/movies/abc', to: 'movies#abc'
  get '/movies/zyx', to: 'movies#zyx'
  
  resources :movies do
    resources :reviews, shallow: true
  end

  resources :genres
  resources :users
  root 'movies#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
