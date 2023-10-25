Rails.application.routes.draw do
  post 'email_already_exists', to: 'users#email_already_exists'
  resources :users, only: %i[create new] do
    member do
      get :confirm_email
    end
  end
  root to: 'users#index'

  get 'register', to: 'registers#new'
  post 'register', to: 'registers#create'

  get 'login', to: 'logins#new'
  post 'login', to: 'logins#authenticate_user'
  delete 'logout', to: 'logins#logout'
  resources :logins, only: %i[new create]
end
