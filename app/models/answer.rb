class Answer < ActiveRecord::Base
  attr_accessible :answer, :question_id, :diva_id

  belongs_to :question
  belongs_to :diva
  
  has_many :user_answers, :dependent => :destroy

  validates :question_id, :presence => true
  validates :diva_id, :presence => true
end