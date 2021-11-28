Rails.application.routes.draw do
  root 'students#index'
  get '/search', to: 'students#search'
  post '/search', to: 'students#create'
  get '/login', to: "sessions#new"
  post '/login', to: 'sessions#create'
  get '/signupstudents', to: 'students#new'
  get '/signupprofessors', to: 'professors#new'
  resources :courses
  resources :teams
  resources :students
  resources :evaluations
  resources :professors
  # resources :course
  # resources :professor
  # resources :project
  # resources :student
  # resources :team
  # resources :user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
