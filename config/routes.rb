Rails.application.routes.draw do
  get 'residents/new'

  root 'static_pages#home'

  get 'static_pages/help'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/developers'

  resources :residents
end
