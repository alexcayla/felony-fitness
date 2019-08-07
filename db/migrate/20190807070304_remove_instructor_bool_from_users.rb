class RemoveInstructorBoolFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :instructor
  end
end
