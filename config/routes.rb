Rails.application.routes.draw do
  devise_for :accounts
  resources :tasks
  resources :projects
  resource :home, only: :show

  root to: 'homes#show'
end
