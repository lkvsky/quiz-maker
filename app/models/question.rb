class Question < ActiveRecord::Base
  attr_accessible :question, :quiz_id

  belongs_to :quiz

  has_many :answers, :dependent => :destroy
  has_many :user_answers, :dependent => :destroy
  has_many :participants, :through => :user_answers,
                          :source => :user

  validates :question, :uniqueness => true
  validates :quiz_id, :presence => true
end