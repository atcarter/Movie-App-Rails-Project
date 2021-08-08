Rails.application.routes.draw do
  get '/auth/google_oauth2/callback'
  resources :reviews
  resources :movies
  resources :genres
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
