class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :instructor_photo
      t.text :bio
      t.text :qualification
      t.text :rapsheet

      t.timestamps
    end
  end
end
