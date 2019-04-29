Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:update, :index, :show, :destroy, :create] do 
  # get 'users', to: 'users#index', as: 'users_url'
  # post 'users', to: 'users#create'
  # patch 'users/:id', to: 'users#update', as: 'user'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'
  # get 'users/:id', to: 'users#show'
  # get 'users/:id', to: 'users#edit'
  # get 'users/:id', to: 'users#new'

  resources :artworks, only: [:index]
end

resources :artworks, only: [:update,:index, :show, :destroy, :create]
end
