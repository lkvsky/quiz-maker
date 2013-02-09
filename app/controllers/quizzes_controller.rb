class QuizzesController < ApplicationController
  def new
    @quiz = Quiz.new
  end

  def create
    quiz = Quiz.new(params[:quiz])
    quiz.save!

    redirect_to quizzes_path
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def index
    @current_user = User.find_by_session_token(session[:session_token])
    
    @quizzes = Quiz.all
    @questions = Question.all
    @divas = Diva.all
    @users = User.all
  end

  def edit
    @quiz = Quiz.find(params[:id])
    @user = User.find_by_session_token(session[:session_token])

    if @user.nil? || @user[:session_token] != session[:session_token]
      redirect_to quizzes_path
    end
  end
end
