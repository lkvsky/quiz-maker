class UserAnswersController < ApplicationController
  def create
    input = UserAnswer.new
    input.answer_id = params[:question][:answer_ids]
    input.question_id = params[:question][:question_id]
    input.user_id = params[:question][:user_id]
    input.save!

    question_sequence(input)
  end

  private

    def question_sequence(input)
      user = User.find(input.user_id)
      answered_question = Question.find(input.question_id)
      quiz = answered_question.quiz
      diva = user.my_diva(quiz) if user.completed_quiz?(quiz)

      if answered_question == quiz.questions.last
        redirect_to diva_path(diva)
      else
        position = quiz.questions.index(answered_question)
        next_question = quiz.questions[position + 1]

        redirect_to question_path(next_question)
      end
    end

end
