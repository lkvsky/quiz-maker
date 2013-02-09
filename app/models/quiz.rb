class Quiz < ActiveRecord::Base
  attr_accessible :name

  has_many :questions, :dependent => :destroy
  has_many :answers, :through => :questions

  validates :name, :presence => true
end