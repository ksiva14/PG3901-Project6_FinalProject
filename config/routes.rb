Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :courses do
    get 'index'
    post 'index', to: 'courses#create', as: 'create'
    put 'index', to: 'courses#update', as: 'update'
    delete 'index', to: 'courses#destroy', as: 'delete'
    get 'navigation'
    # put 'navigation', to: 'teams#update', as: 'update_team'
    post 'navigation', to: 'teams#create', as: 'create_team'
  end
  resources :teams do
    put 'update', to: 'teams#update', as: 'update'
  end
  resources :students do
    put 'edit', to: 'students#update'
  end
  resources :projects
  resources :evaluations
  resources :users

  root 'sessions#new'
  # TODO: are these 2 lines in use??
  get '/search', to: 'students#search'
  post '/search', to: 'students#create'
  # ----------------------- login ----------------------------
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  # ------------------------ logout ---------------------------
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
  # ----------------------- sign up ----------------------------
  get '/signupstudents', to: 'users#newStudent'
  post '/signupstudents', to: 'users#createStudent'
  get '/signupprofessors', to: 'users#newProfessor'
  post '/signupprofessors', to: 'users#createProfessor'
  # ----------------------- evaluation ----------------------------
  get 'static_pages', to: 'static_pages#dashboard', as: :student_dashboard
  get 'static_pages', to: 'static_pages#view', as: :view_evaluations
  # ----------------------- admin ----------------------------
  get '/:id/search', to: 'students#search' # TODO: i think can delete
  # adding student to course - search bar in navigation.html.erb
  post '/:id/search', to: 'students#create'

  get '/:id/students/22/edit', to: 'students#create'
  get '/courses/:id/course_navigation', to: 'courses#navigation'
  get '/courses/:id/course_navigation/new_team', to: 'teams#new'
  get '/courses/:id/course_navigation/new_student', to: 'students#new'
  # route to remove student from team - teams/show.html.erb
  delete '/student/:id', to: 'students#destroy', as: 'remove_student'
end
