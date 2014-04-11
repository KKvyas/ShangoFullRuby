class AddIconColumnToActivities < ActiveRecord::Migration
  def change
  	add_attachment :activities, :icon
  end
end
