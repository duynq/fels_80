class Lesson < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :results
  has_many :words, through: :results
  has_many :answers, through: :results
  has_many :lesson_words
  has_many :words, through: :lesson_words 
end
