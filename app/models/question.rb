class Question < ActiveRecord::Base
  attr_accessible :question

  has_many :answers
  has_many :user_answers, :dependent => :destroy
  has_many :participants, :through => :user_answers,
                          :source => :user

  validates :question, :uniqueness => true
end