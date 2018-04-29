Rails.application.routes.draw do
  devise_for :users
  resources :works, except: [:show]

  #custom scope
  get 'angular', to: 'works#angular'

  get 'work/:id', to: 'works#show', as: 'work_show'

  get 'contact', to: 'pages#contact'

  get 'about-me', to: 'pages#about'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
end
