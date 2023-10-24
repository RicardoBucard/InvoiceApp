Rails.application.routes.draw do
  resources :users, only: %i[create index new] do
    member do
      get :confirm_email
    end
  end
  root to: 'users#index'

  get 'register', to: 'registers#new'
  post 'register', to: 'registers#create'
end
