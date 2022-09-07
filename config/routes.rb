Rails.application.routes.draw do
  get '/discover', to: 'users#discover'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root 'home_page#index'
   resources :users
   resources :sessions
   resources :movies
   resources :register
   resources :viewing_parties
end
