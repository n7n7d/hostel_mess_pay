Rails.application.routes.draw do
  get 'sessions/new'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'static_pages#home'
  get 'static_pages/home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'developers' => 'static_pages#developers'

  #for resident model
  resources :residents
  get 'residents/new'
  #for User model
  resources :users
  get 'signup'  => 'users#new'
  #for sessions
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :account_activations, only: [:edit]
end
