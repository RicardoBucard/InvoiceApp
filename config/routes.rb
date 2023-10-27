Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get 'new_invoice_email/:id', to: 'invoices#new_invoice_email', as: 'new_invoice_email'
  get 'sends_new_invoice_email/:id', to: 'invoices#sends_new_invoice_email', as: 'sends_new_invoice_email'
  get 'download_pdf/:id', to: 'invoices#download_pdf', as: 'download_pdf'
  resources :invoices, only: %i[create index new show ]
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
