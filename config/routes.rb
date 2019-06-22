Rails.application.routes.draw do

  get 'posts/index'
  root 'home#top'
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  resources 'users'
  resources 'langs' do
    resources 'elems'
  end

  resources 'records' do
    resources 'record_elems'
  end
end
