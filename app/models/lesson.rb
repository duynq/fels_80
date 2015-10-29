class Lesson < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :results
  has_many :lesson_words, dependent: :destroy
  accepts_nested_attributes_for :lesson_words
end
