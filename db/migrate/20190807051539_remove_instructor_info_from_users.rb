class RemoveInstructorInfoFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :bio
    remove_column :users, :qualification
    remove_column :users, :rapsheet
  end
end
