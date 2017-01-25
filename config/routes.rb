Rails.application.routes.draw do
  get 'notes/index'

  get 'notes/show'

  get 'notes/new'

  get 'notes/create'

  get 'notes/edit'

  get 'notes/update'

  get 'notes/destroy'

  get 'comments/index'

  get 'comments/show'

  get 'comments/new'

  get 'comments/create'

  get 'comments/edit'

  get 'comments/update'

  get 'comments/destroy'

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
  get '/about' => 'welcome#about', as: 'about'

  root to: "welcome#index"

  get 'users/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  put 'inspections/:id(.:format)' => 'inspections#approve', as: 'approve_inspection'
  get 'inspections/history' => 'inspections#history', as: 'inspections_history'

  post '/jobs/:id/notes/new(.:format)' => 'notes#create'



  resources :jobs

  resources :admins

  resources :inspections

  resources :jobs do
    resources :notes
  end


  resources :users do
    resources :jobs
  end

  resources :jobs do
    resources :inspections
  end


end
