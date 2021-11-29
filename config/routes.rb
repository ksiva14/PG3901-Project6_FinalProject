Rails.application.routes.draw do
  
  resources :courses
  get '/search', to: 'students#search'
  post '/search', to: 'students#create'
  get '/:id/navigation', to: 'courses#navigation'
  
 
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
