Rails.application.routes.draw do

  get 'elems/index'
  get 'elems/new'
  get 'elems/show'
  root 'home#top'
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  resources 'users'
  resources 'langs'

end
