Rails.application.routes.draw do
  # get 'bands/index'
  # get 'bands/create'
  # get 'bands/destroy'
  # get 'bands/edit'
  # get 'bands/update'
  # get 'bands/new'
  # get 'bands/show'
  # get 'sessions/create'
  # get 'sessions/new'
  # get 'sessions/destroy'
  # get 'users/create'
  # get 'users/new'
  # get 'users/show'

  resources :users, only: [:create, :new, :show]
  resource :session, only: [:new, :destroy, :create]

  resources :bands
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
