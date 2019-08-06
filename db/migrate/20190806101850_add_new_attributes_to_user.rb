class AddNewAttributesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :photo, :string
    add_column :users, :instructor, :boolean
    add_column :users, :bio, :text
    add_column :users, :qualification, :text
    add_column :users, :rapsheet, :text
  end
end
