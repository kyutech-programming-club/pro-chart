Rails.application.routes.draw do

  get 'langs/index'
  get 'langs/new'
  get 'langs/show'
  root 'users#index'
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  resources 'users'
end
