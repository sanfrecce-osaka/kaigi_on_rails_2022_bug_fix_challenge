Rails.application.routes.draw do
  resources :tasks
  resources :projects
  resource :home, only: :show

  root to: 'homes#show'
end
