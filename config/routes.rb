

Rails.application.routes.draw do
  use_doorkeeper

  mount Base => '/'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'course#index'
  get '/add', to:'course#new', as:'create_course'
  get 'course/:id', to: 'course#show', as: 'show_course'
  post '/add', to: 'course#create', as: 'store_course'
  get 'course/details/:id', to: 'course#details', as: 'details_course'
  post 'course/:id/update', to: 'course#edit', as: 'update_course'
  get 'course/:id/delete', to: 'course#destroy', as: 'delete_course'
  get '/departments', to: 'department#index', as: 'departments'
  get '/department/add', to:'department#new', as:'create_department'
  get 'department/:id', to: 'department#show', as: 'show_department'
  get 'department/details/:id', to: 'department#details', as: 'details_department'
  post 'department/add', to: 'department#create', as: 'store_department'
  post 'department/:id/update', to: 'department#edit', as: 'update_department'
  get 'department/:id/delete', to: 'department#destroy', as: 'delete_department'
  get '/teachers', to: 'teacher#index', as: 'teachers'
  get '/teacher/add', to: 'teacher#new', as: 'create_teacher'
  get 'teacher/:id', to: 'teacher#show', as: 'show_teacher'
  post 'teacher/add', to: 'teacher#create', as: 'store_teacher'
  get 'teacher/details/:id', to: 'teacher#details', as: 'details_teacher'
  post 'teacher/:id/update', to: 'teacher#edit', as: 'update_teacher'
  get 'teacher/:id/delete', to: 'teacher#destroy', as: 'delete_teacher'
  get '/students', to: 'student#index', as: 'students'
  get '/student/add', to: 'student#new', as: 'create_student'
  get 'student/:id', to: 'student#show', as: 'show_student'
  post 'student/add', to: 'student#create', as: 'store_student'
  #get 'student', to: 'student#courselist', as: 'course_list'
  #get 'student/enroll/:id', to: 'student#enroll', as: 'enroll_student'
  get 'student/details/:id', to: 'student#details', as: 'details_student'
  post 'student/:id/update', to: 'student#edit', as: 'update_student'
  get 'student/:id/delete', to: 'student#destroy', as: 'delete_student'
  get 'profile/:id', to: 'profile#index', as: 'show_profile'
  get 'profile/:id/details/:id', to: 'profile#details', as: 'details_profile'
  get 'takencourse', to: 'taken_course#courselist', as: 'course_list'
  get 'takencourse/enroll/:id', to: 'taken_course#enroll', as: 'enroll_student'


end
