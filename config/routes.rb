Rails.application.routes.draw do
  resources :works



  resources :blogs

  get 'contact', to: 'pages#contact'
  get 'about-me', to: 'pages#about'
  root to: 'pages#home'
end
