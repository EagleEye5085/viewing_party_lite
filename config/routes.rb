Rails.application.routes.draw do
  get '/discover', to: 'users#discover'
  root 'home_page#index'
  resources :users
  resources :sessions
  resources :movies
  resources :viewing_parties
end
