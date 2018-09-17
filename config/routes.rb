Rails.application.routes.draw do
  get 'students/new'
  get 'students/create'
  get 'students/edit'
  get 'students/update'
  get 'students/index'
  get 'students/show'
  get 'students/destroy'
  root 'students#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
