class QuestionsController < ApplicationController
  def create
    @question = Question.new(params[:question])

    begin
      @question.save!
      flash[:notice] = "question successfully saved!"
    rescue
      flash[:notice] = @question.errors.full_messages.first
    end

    redirect_to edit_quiz_path
  end

  def edit
    @question = Question.find(params[:id])
    p @question
  end

  def update
  end

  def destroy
    @question = Question.find(params[:id])
    flash[:notice] = "question destroyed"
    @question.destroy

    redirect_to edit_quiz_path
  end
end
