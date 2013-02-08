class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.save!

    redirect_to new_session_path
  end

  def destroy
    @user = User.find(params[:id])
    flash[:notice] = "user destroyed"
    @user.destroy

    redirect_to edit_quiz_path
  end
end
