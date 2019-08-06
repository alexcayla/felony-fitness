class AddKindToActivityTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :activity_types, :kind, :string
  end
end
