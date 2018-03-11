Rails.application.routes.draw do
  root "welcome#about"
  
  get '/signup', to: "registrations#new"
  post '/signup', to: "registrations#create"

  resources :chatrooms, param: :slug
  resources :messages

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
