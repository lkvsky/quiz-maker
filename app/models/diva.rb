class Diva < ActiveRecord::Base
  attr_accessible :name, :description

  has_many :answers
  has_many :user_answers, :through => :answers

  validates :name, :uniqueness => true

end