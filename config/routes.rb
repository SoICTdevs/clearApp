Rails.application.routes.draw do
  namespace :admin do
    get 'applications/edit'
    get 'applications/update'
    get 'applications/index'
    get 'applications/show'
    get 'applications/destroy'
  end
  namespace :admin do
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
  end
  namespace :admin do
    get 'users/new'
    get 'users/create'
    get 'users/edit'
    get 'users/update'
    get 'users/index'
    get 'users/show'
    get 'users/destroy'
  end
  get 'applications/new'
  get 'applications/create'
  get 'students/new'
  get 'students/create'
  get 'students/edit'
  get 'students/update'
  get 'students/index'
  get 'students/show'
  get 'students/destroy'

  namespace :users do
    resources :applications, :users
  end
  namespace :admin do
    resources :users, :applications 
  end

  resources :applications, only: [:new, :create]
  root 'students#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
