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
  # resources :companies do
  # resources :comments
  # resources :jobs
  # 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :questions do
    resources :answers
        end
  # Defines the root path route ("/")
# end
  # Defines the root path route ("/")
  # root "articles#index"
  post '/companies/:question_id/answers', to: 'answers#create'
  resources :companies do
    resources :comments
  resources :jobs do  
    resources :questions  
      end
  end
  # post '/companies/:company_id/jobs/:job_id/questions', to: 'questions#create', as: 'job_questions'

  resources :users do
    resources :comments
  end
end












# resources :jobs do
  # get :new_posting, on: :collection
  # post :create_posting, on: :collection
# end
# 
# resources :applications do
  # get :new_submission, on: :collection
  # post :create_submission, on: :collection
# end
# 
