class Activity < ActiveRecord::Base
  belongs_to :user

  following_ids = "SELECT followed_id from relationships where
    followed_id = :user_id"
  scope :recent, ->{order "created_at DESC"}
  scope :followed, ->user{where " user_id IN (#{following_ids}) OR
    user_id = ?",user.id}

  validates :user_id, presence: true
  validates :target_id, presence: true
  validates :type_action, presence: true

  def target
    if type_action == Settings.activities.learned
      Lesson.find_by id: target_id
    else
      User.find_by id: target_id
    end
  end
end
