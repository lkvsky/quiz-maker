class QuestionsController < ApplicationController
  def create
    question = Question.new(params[:question])

    begin
      question.save!
      flash[:notice] = "Question successfully saved!"
    rescue
      flash[:notice] = question.errors.full_messages.first
    end

    redirect_to edit_quiz_path(question.quiz)
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    question.question = params[:question][:question]
    question.save!

    redirect_to edit_quiz_path(question.quiz)
  end

  def destroy
    question = Question.find(params[:id])
    flash[:notice] = "question destroyed"
    question.destroy

    redirect_to edit_quiz_path(question.quiz)
  end
end
