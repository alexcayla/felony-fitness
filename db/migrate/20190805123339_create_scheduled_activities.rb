class CreateScheduledActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :scheduled_activities do |t|
      t.datetime :date
      t.references :user, foreign_key: true
      t.references :activity_type, foreign_key: true
      t.string :location
      t.integer :capacity

      t.timestamps
    end
  end
end
