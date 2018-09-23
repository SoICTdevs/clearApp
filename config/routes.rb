Rails.application.routes.draw do
  get 'applications/new'
  get 'applications/create'
  get 'applications/show'
  get 'login' => 'sessions#new', :as => 'login'
  get 'sessions/create'
  get 'logout' => 'sessions#destroy', :as => 'logout'
  namespace :admin do
    get 'applications/edit'
    get 'applications/update'
    get 'applications/index'
    get 'applications/show'
    get 'applications/destroy'
  end
  namespace :admin do
    get 'login' => 'sessions#new', :as => 'login'
    get 'sessions/create'
    get 'logout' => 'sessions#destroy', :as => 'logout'
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
  get 'students/new'
  get 'students/create'
  get 'students/edit'
  get 'students/update'
  get 'students/index'
  get 'students/show'
  get 'students/destroy'

  namespace :admin do
    resources :users, :applications, :sessions 
  end

  resources :applications, only: [:new, :create, :show]
  resources :students, :sessions
  root 'students#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
