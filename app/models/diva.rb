class Diva < ActiveRecord::Base
  attr_accessible :name

  has_many :answers
  has_many :user_answers, :through => :answers

  validates :name, :uniqueness => true

end