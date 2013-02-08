class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation

  has_secure_password
  has_many :user_answers, :dependent => :destroy
  has_many :answers, :through => :user_answers
  has_many :answered_questions, :through => :answers, :source => :question

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true

  def log_out
    self.session_token = nil
  end

  def my_diva
    self.answers.group(:diva_id).order('COUNT(diva_id) DESC').first.diva_id
  end

  def completed_quiz?(quiz)
    self.answered_questions.where(:quiz_id => quiz.id).count == quiz.questions.count
  end

  def completed_quizzes
    quizzes = []
    Quiz.all.map { |quiz| quizzes << quiz if completed_quiz?(quiz) }
    
    quizzes
  end
end