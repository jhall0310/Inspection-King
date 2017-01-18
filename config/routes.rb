Rails.application.routes.draw do
  get 'inspections/index'

  get 'inspections/new'

  get 'inspections/destroy'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  get 'users/new'

  get 'users/create'

  get 'admins/show'

  devise_for :admins
  get 'welcome/index'

  root to: "welcome#index"

  get 'users/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  put 'inspections/:id(.:format)' => 'inspections#approve', as: 'approve_inspection'

  resources :jobs

  resources :admins

  resources :inspections

  resources :users do
    resources :jobs
  end

  resources :jobs do
    resources :inspections
  end


end
