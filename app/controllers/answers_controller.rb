class AnswersController < ApplicationController
  def create
    @answer = Answer.new(params[:answer])

    begin
      @answer.save!
      flash[:notice] = "answer successfully saved!"
    rescue
      flash[:notice] = @answer.errors.full_messages.first
    end

    redirect_to edit_quiz_path
  end

  def destroy
    @answer = Answer.find(params[:id])
    flash[:notice] = "answer destroyed"
    @answer.destroy

    redirect_to edit_quiz_path
  end
end
