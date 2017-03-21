Rails.application.routes.draw do
  resources :online_judges
  root to: 'thredded/messageboards#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  get '/home', to: 'home#show'
  mount Thredded::Engine => '/'
end
