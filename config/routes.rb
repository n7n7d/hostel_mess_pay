Rails.application.routes.draw do
  root 'static_pages#home'
  get 'developers' => 'static_pagers#developers'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  resources :residents
  get 'residents/new'
end
