Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :accounts, controllers: {
    sessions: 'accounts/sessions',
    registrations: 'accounts/registrations',
    confirmations: 'accounts/confirmations',
  }
  resources :tasks
  resources :projects
  resource :home, only: :show

  root to: 'homes#show'

  mount LetterOpenerWeb::Engine, at: 'letter_opener' if Rails.env.development?
end
