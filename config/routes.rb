Rails.application.routes.draw do
  resources :date_values
  resources :golds
  resources :usds
  resources :ufs
  resources :homes
  get 'home/index'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
