Rails.application.routes.draw do
  # get 'static_pages/dashboard'
  resources :evaluations

  # resources :course
  # resources :professor
  # resources :project
  # resources :student
  # resources :team
  # resources :user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#dashboard'
end
