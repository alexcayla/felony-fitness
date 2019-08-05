class CreateActivityTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_types do |t|
      t.string :name
      t.text :description
      t.integer :duration
      t.integer :price
      t.text :restrictions
      t.string :type
      t.string :sport

      t.timestamps
    end
  end
end
