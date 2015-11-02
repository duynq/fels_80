class AddTypeActionActivities < ActiveRecord::Migration
  def change
    add_column :activities, :type_action, :string
  end
end
