class AddUserForeignKeyToInstructor < ActiveRecord::Migration[5.2]
  def change
    add_reference :instructors, :user, null: false, foreign_key: true
  end
end
