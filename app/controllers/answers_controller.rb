class AnswersController < ApplicationController
  def create
    answer = Answer.new(params[:answer])

    if answer.save
      flash[:notice] = "Answer successfully saved!"
    else
      flash[:notice] = answer.errors.full_messages.first
    end

    quiz = answer.question.quiz
    redirect_to edit_quiz_path(quiz)
  end

  def update
    answer = Answer.find(params[:id])
    answer.answer = params[:answer][:answer]
    answer.question_id = params[:answer][:question_id]
    answer.diva_id = params[:answer][:diva_id]
    answer.save!

    redirect_to edit_question_path(answer.question)
  end

  def destroy
    answer = Answer.find(params[:id])
    flash[:notice] = "answer destroyed"
    answer.destroy

    redirect_to edit_question_path(answer.question)
  end
end
