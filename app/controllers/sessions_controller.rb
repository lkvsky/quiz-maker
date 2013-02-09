class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    session_token = SecureRandom.urlsafe_base64
    @user.session_token = session_token

    if @user.nil?
      flash[:notice] = "Looks like you don't exist yet."
    end
    
    if @user.save && @user.authenticate(params[:user][:password])
      session[:session_token] = session_token
      redirect_to quizzes_path
    else
      flash[:notice] = "Looks like you don't exist yet."
      redirect_to root_path
    end
  end

  def destroy
    user = User.find_by_session_token(session[:session_token])
    user.log_out
    session[:session_token] = nil

    redirect_to root_path
  end
end
