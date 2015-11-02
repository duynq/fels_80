class RemoveTimeFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :time, :date
  end
end
