Rails.application.routes.draw do
  root 'welcome#index'

  resources :project_links
  resources :project_images
  resources :projects
  resources :user_links
  resources :users
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
end
