Rails.application.routes.draw do
  get '/evaluation', to: 'static_pages#evaluation'
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#evaluation'
end
