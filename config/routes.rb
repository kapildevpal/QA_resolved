Rails.application.routes.draw do
    
  get 'emp_companies/index'
  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'
    # get 'emp_companies/index'

 end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "companies#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get '/register', to: 'users#new'
  
  # Defines the root path route ("/")
  resources :companies do
  resources :comments
  resources :jobs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
  # Defines the root path route ("/")
  # root "articles#index"
end
