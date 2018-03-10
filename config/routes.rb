Rails.application.routes.draw do
  root "welcome#about"
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  resources :chatrooms, param: :slug
  resources :messages

end
