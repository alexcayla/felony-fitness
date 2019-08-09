class AddPhotoToActivityTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :activity_types, :photo, :string
  end
end
