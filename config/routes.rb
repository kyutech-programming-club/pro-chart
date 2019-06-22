Rails.application.routes.draw do

  get 'records/index'
  get 'records/new'
  get 'records/show'
  root 'home#top'
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  resources 'users'
  resources 'langs' do
    resources 'elems'
  end

end
