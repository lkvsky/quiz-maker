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

  def update
    answer = Answer.find(params[:answer][:id])
    answer.answer = params[:answer][:answer]
    answer.question_id = params[:answer][:question_id]
    answer.diva_id = params[:answer][:diva_id]
    answer.save!

    redirect_to edit_question_path(answer.question_id)
  end

  def destroy
    @answer = Answer.find(params[:id])
    flash[:notice] = "answer destroyed"
    @answer.destroy

    redirect_to edit_quiz_path
  end
end
