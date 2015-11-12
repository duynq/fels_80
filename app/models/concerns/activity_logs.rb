module ActivityLogs
  def create_activity user_id, target_id, type_action
    Activity.create! user_id: user_id, target_id: target_id, type_action: type_action
  end

  def detete_activity user_id
    @activity = Activity.target(user_id)
    @activity.each do |activity|
      Activity.find_by(id: activity.id).destroy
    end
  end
end
