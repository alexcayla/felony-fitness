class AddInstructorToScheduledActivities < ActiveRecord::Migration[5.2]
  def change
    add_reference :scheduled_activities, :instructor, foreign_key: {to_table: :users}
  end
end
