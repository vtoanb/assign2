Rails.application.routes.draw do

  resources :friends
  resources :messages

  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  get 'signout', to: 'sessions#destroy'


	root to: 'users#index'
  resources :users do
    resources :inboxes do
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
