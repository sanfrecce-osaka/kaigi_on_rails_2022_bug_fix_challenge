Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :accounts
  resources :tasks
  resources :projects
  resource :home, only: :show

  root to: 'homes#show'

  mount LetterOpenerWeb::Engine, at: 'letter_opener' if Rails.env.development?
end
