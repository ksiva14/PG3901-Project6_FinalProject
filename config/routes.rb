Rails.application.routes.draw do
  resources :evaluations

  # resources :course
  # resources :professor
  # resources :project
  # resources :student
  # resources :team
  # resources :user
  # get '/evaluation', to: 'static_pages#evaluation'
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#evaluation'
end
