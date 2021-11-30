Rails.application.routes.draw do
  
  resources :courses
  get '/:id/search', to: 'students#search'
  post '/:id/search', to: 'students#create'
  get '/:id/students/22/edit', to: 'students#create'
  get '/courses/:id/course_navigation', to: 'courses#navigation'
  get '/courses/:id/course_navigation/new_team', to: 'teams#new'
  get '/courses/:id/course_navigation/new_student', to: 'students#new'


  
 
  resources :teams
  resources :students
  root 'students#index'
  resources :evaluations

  resource :courses do
    get "navigation"
  end
  # resources :course
  # resources :professor
  # resources :project
  # resources :student
  # resources :team
  # resources :user
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
