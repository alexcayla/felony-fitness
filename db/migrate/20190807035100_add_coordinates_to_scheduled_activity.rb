class AddCoordinatesToScheduledActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :scheduled_activities, :latitude, :float
    add_column :scheduled_activities, :longitude, :float
  end
end
