Rails.application.routes.draw do

  root 'home#top'
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  resources 'users'
  resources 'langs' do
    resources 'elems' do
      resources 'posts'
    end
  end

  resources 'records' do
    resources 'record_elems'
  end
end
