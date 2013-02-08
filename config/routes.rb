DivaQuiz::Application.routes.draw do
  resource :session, :only => [:new, :show, :destroy, :create]
  resource :quiz, :only => [:show, :edit]
  resources :users
  resources :divas
  resources :questions
  resources :answers

  root :to => "sessions#new"
end
