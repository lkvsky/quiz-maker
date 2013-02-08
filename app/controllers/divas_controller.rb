class DivasController < ApplicationController
  def create
    @diva = Diva.new(params[:diva])

    begin
      @diva.save!
      flash[:notice] = "#{@diva.name} successfully saved!"
    rescue
      flash[:notice] = @diva.errors.full_messages.first
    end

    redirect_to edit_quiz_path
  end

  def edit
    @diva = Diva.find(params[:id])
  end

  def update
    diva = Diva.find(params[:id])
    diva.name = params[:diva][:name]
    diva.description = params[:diva][:description]
    diva.save!

    redirect_to edit_quiz_path
  end

  def destroy
    @diva = Diva.find(params[:id])
    flash[:notice] = "diva destroyed"
    @diva.destroy

    redirect_to edit_quiz_path
  end
end
