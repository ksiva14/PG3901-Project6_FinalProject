Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :courses do
    get 'index'
    post 'index', to: 'courses#create', as: 'create'
    put 'index', to: 'courses#update', as: 'update'
    delete 'index', to: 'courses#destroy', as: 'delete'
    get 'navigation'
    post 'navigation', to: 'teams#create', as: 'create_team'
  end
  resources :teams do
    put 'update', to: 'teams#update', as: 'update'
  end
  resources :students do
    put 'edit', to: 'students#update'
  end
  resources :projects do
    get 'add-team', to: 'projects#create_project_team'
    post 'add-team', to: 'projects#create_project_team', as: 'create_team'
    delete 'remove-student', to: 'projects#remove_team', as: 'remove_team'
    get 'update-project', to: 'projects#update'
    patch 'update-project', to: 'projects#update', as: 'update'
    get 'change_average', to: 'projects#set_avg_score'
    patch 'change_average', to: 'projects#set_avg_score', as: 'update_avg'
  end
  resources :evaluations do
  end
  resources :users

  root 'sessions#new'

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
  get 'static_pages/view_evaluations', to: 'static_pages#view_evaluations', as: :view_evaluations
  # ----------------------- admin ----------------------------
  post '/:id/search', to: 'students#create'
  post '/addstudent', to: 'students#createFromTeam'

  get '/:id/students/22/edit', to: 'students#create'
  get '/courses/:id/course_navigation', to: 'courses#navigation'
  get '/courses/:id/course_navigation/new_team', to: 'teams#new'
  get '/courses/:id/course_navigation/new_student', to: 'students#new'
  # route to remove student from team - teams/show.html.erb
  delete '/student/:id', to: 'students#destroy', as: 'remove_student'
end
