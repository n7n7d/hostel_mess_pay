Rails.application.routes.draw do
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
  #for User model
  resources :users
  get 'signup'  => 'users#new'
  #for sessions
  get    'login'   => 'static_pages#home'
  post   'login'   => 'sessions#create'
  get 'logout'  => 'sessions#destroy'

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]

  #for leave model
   resources :leaves, only: [:new,:create,:delete,:show]
   get 'leaves' =>'leaves#show'

  #for account model
  resources :accounts, only:[:create,:show,:update]

  #for bills model
  resources :bills, only:[:new,:create,:show,:update]
  get 'bills' =>'bills#show'
end
