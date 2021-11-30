Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :courses
  resources :teams
  resources :students
  resources :evaluations
  resources :users

  root 'sessions#new'
  get '/search', to: 'students#search'
  post '/search', to: 'students#create'
  # ----------------------- login ----------------------------
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  # ----------------------- sign up ----------------------------
  get '/signupstudents', to: 'users#newStudent'
  post '/signupstudents', to: 'users#createStudent'
  get '/signupprofessors', to: 'users#newProfessor'
  post '/signupprofessors', to: 'users#createProfessor'
  # ----------------------- evaluation ----------------------------
  get 'static_pages', to: 'static_pages#dashboard', as: :student_dashboard
  get 'static_pages', to: 'static_pages#view', as: :view_evaluations
end
