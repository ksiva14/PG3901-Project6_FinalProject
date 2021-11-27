Rails.application.routes.draw do
  get '/groups', to: 'groups#index'
  get '/users', to: 'users#index'
  resources :teams
  resources :students
  root 'students#index'
  resources :evaluations
  # resources :course
  # resources :professor
  # resources :project
  # resources :student
  # resources :team
  # resources :user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
