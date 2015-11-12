class Activity < ActiveRecord::Base
  belongs_to :user

  scope :recent, ->{order "created_at DESC"}
  scope :feed_all, ->(following_ids, user){where "user_id IN (?) OR user_id = ?", following_ids, user.id}
  scope :target, ->target_id{where "target_id = ?",target_id }

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
