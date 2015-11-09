class Lesson < ActiveRecord::Base
  include ActivityLogs

  belongs_to :category
  belongs_to :user
  has_many :results
  has_many :words, through: :lesson_words
  has_many :lesson_words, dependent: :destroy
  accepts_nested_attributes_for :lesson_words

  before_create :init_lessons
  scope :lesson, -> user_id{where("user_id = ?",user_id).last}
  after_create :save_activity

  def time_remaining
    Settings.lesson.duration_in_minutes*60 - (Time.zone.now - self.created_at).to_i
  end

  private
  def init_lessons
    self.words = self.category.words.order("RANDOM()").limit Settings.number_word_in_lessons
  end

  def save_activity
    create_activity user_id, id, Settings.activities.learned
  end
end
