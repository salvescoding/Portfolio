Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :works, except: [:show] do
    put :sort, on: :collection
  end

  #custom scope
  get 'angular', to: 'works#angular'
  get 'work/:id', to: 'works#show', as: 'work_show'

  get 'contact', to: 'pages#contact'
  get 'about-me', to: 'pages#about'
  get 'tech_news', to: 'pages#tech_news'

  resources :topics, only: [:index, :show]



  resources :blogs do
    member do
      get :toggle_status
    end
  end

  mount ActionCable.server => '/cable'

  root to: 'pages#home'
end
