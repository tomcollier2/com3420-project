Rails.application.routes.draw do
  get 'recording_test/new'
  get 'recording_test/create'
  # get '/recording_test/audio_recording_controller.js', to: ''
  devise_for :students, controllers: {
    registrations: 'students'
  }
  devise_for :tutors, controllers: {
    registrations: 'tutors'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :tutors
  
  resources :students
  
  resources :instruments

  resources :music_sessions

  resources :music_sessions do
    resources :tasks
  end

  resources :music_sessions do
    resources :student_sessions, only: [:new, :create]
  end

  resources :pages
  
  get "dashboard", to: "pages#dashboard"
  # Defines the root path route ("/")
  root "pages#home"
end
