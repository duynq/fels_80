class AddAnswerRefToLessonWords < ActiveRecord::Migration
  def change
    add_reference :lesson_words, :answer, index: true, foreign_key: true
  end
end
