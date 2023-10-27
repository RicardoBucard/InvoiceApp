Rails.application.routes.draw do
  resources :invoices
  root to: 'pages#home'
  
  post 'email_already_exists', to: 'users#email_already_exists'
  resources :users, only: %i[create new] do
    member do
      get :confirm_email
    end
  end
  get 'register', to: 'registers#new'
  post 'register', to: 'registers#create'
  
  get 'login', to: 'logins#new'
  post 'login', to: 'logins#login'
  delete 'logout', to: 'logins#logout'
  resources :logins, only: %i[new create]
end
