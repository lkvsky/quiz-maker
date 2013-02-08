class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    session_token = SecureRandom.urlsafe_base64

    if @user.nil?
      flash[:notice] = "Looks like you don't exist yet."
    end
    
    begin
      @user.authenticate(params[:user][:password])
      @user.session_token = session_token
      @user.save!
      session[:session_token] = session_token
      redirect_to edit_quiz_path
    rescue
      flash[:notice] = "Looks like you don't exist yet."
      redirect_to root_path
    end
  end
end
