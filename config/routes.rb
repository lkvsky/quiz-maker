DivaQuiz::Application.routes.draw do
  resource :session, :only => [:new, :destroy, :create]
  resources :quizzes
  resources :users
  resources :divas
  resources :questions
  resources :answers

  root :to => "sessions#new"
end
