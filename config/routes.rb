Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#main'

  resources :users, only: %i[new create show]
  # Routing 'users' to 'users#new' to avoid crash in page refresh after form validation error
  get 'users', to: 'users#new'
end
