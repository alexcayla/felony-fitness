class RemoveTypeFromActivityTypes < ActiveRecord::Migration[5.2]
  def change
    remove_column :activity_types, :type
  end
end
