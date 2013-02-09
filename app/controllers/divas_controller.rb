class DivasController < ApplicationController
  def new
    @diva = Diva.new
  end

  def create
    @diva = Diva.new(params[:diva])

    begin
      @diva.save!
      flash[:notice] = "#{@diva.name} successfully saved!"
    rescue
      flash[:notice] = @diva.errors.full_messages.first
    end

    redirect_to quizzes_path
  end

  def edit
    @diva = Diva.find(params[:id])
  end

  def show
    @diva = Diva.find(params[:id])
    @user = User.find_by_session_token(session[:session_token])
  end

  def update
    diva = Diva.find(params[:id])
    diva.name = params[:diva][:name]
    diva.description = params[:diva][:description]
    diva.save!

    redirect_to quizzes_path
  end

  def destroy
    @diva = Diva.find(params[:id])
    flash[:notice] = "diva destroyed"
    @diva.destroy

    redirect_to quizzes_path
  end
end
