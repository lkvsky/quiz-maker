class QuizzesController < ApplicationController
  def show
    render :json => "Nothing to show here"
  end

  def edit
    @user = User.find_by_session_token(session[:session_token])

    if @user.nil? || @user[:session_token] != session[:session_token]
      redirect_to quiz_path
    end

    @diva = Diva.new
    @question = Question.new
    @answer = Answer.new
  end
end
