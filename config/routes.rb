Rails.application.routes.draw do

  get 'home/top'
  root 'users#index'
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  resources 'users'
  resources 'langs'

end
