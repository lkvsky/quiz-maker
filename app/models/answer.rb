class Answer < ActiveRecord::Base
  attr_accessible :answer, :question_id, :diva_id

  belongs_to :question
  belongs_to :diva
  
  has_many :user_answers
end