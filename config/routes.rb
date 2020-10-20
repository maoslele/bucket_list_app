Rails.application.routes.draw do
  devise_for :users
  resources :posts
  get "/" => "home#top"
  get "about" => "home#about"
end
