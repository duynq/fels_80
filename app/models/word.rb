class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :lesson_words
  has_many :results

  scope :all_word, ->user_id{}
  scope :learned, ->user_id{where("id in (select word_id from lesson_words where
    lesson_id in (select id from lessons where user_id = #{user_id}))")}
  scope :no_learn, ->user_id{where("id not in (select word_id from lesson_words where
    lesson_id in (select id from lessons where user_id = #{user_id}))")}

  accepts_nested_attributes_for :answers, allow_destroy: true
end
