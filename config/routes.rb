Rails.application.routes.draw do

  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  get 'signout', to: 'sessions#destroy'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

	root to: 'users#index'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
