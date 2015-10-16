class LessonWord < ActiveRecord::Base
  belongs_to :word
  belongs_to :lesson
end
