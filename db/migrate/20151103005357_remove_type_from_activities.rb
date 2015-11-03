class RemoveTypeFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :type, :integer
  end
end
