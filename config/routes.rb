Rails.application.routes.draw do
  namespace :admin do
    get 'departments/new'
    get 'departments/create'
    get 'departments/edit'
    get 'departments/update'
    get 'departments/index'
    get 'departments/show'
    get 'departments/destroy'
  end
  namespace :admin do
    get 'schools/new'
    get 'schools/create'
    get 'schools/edit'
    get 'schools/update'
    get 'schools/index'
    get 'schools/show'
    get 'schools/destroy'
  end
  namespace :admin do
    get 'password_resets/new'
    get 'password_resets/create'
    get 'password_resets/edit'
    get 'password_resets/update'
  end
  get 'password_resets/new'
  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'
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
    resources :users, :applications, :sessions, :password_resets, :schools, :departments
  end

  resources :applications, only: [:new, :create, :show, :index]
  resources :students, only: [:edit, :update, :show, :new, :create, :index] 
  resources :sessions, :password_resets
  root 'students#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
