Rails.application.routes.draw do

  get 'submit',    to: 'users#submit',     as: 'submit'
  post 'submit',   to: 'users#create'

  get 'signup',    to: 'users#new',        as: 'signup'
  get 'login' ,    to: 'sessions#new',     as: 'login'
  get 'logout',    to: 'sessions#destroy', as: 'logout'

  get 'tags/:tag', to: 'talks#index',      as: :tag

  get 'dashboard', to: 'dashboards#index', as: 'dashboard'

  resources :users, :sessions

  resources :talks do
    member do
      put "approve"
      put "reject"
      put "delay"
    end
  end

  root 'dashboards#main'
end
