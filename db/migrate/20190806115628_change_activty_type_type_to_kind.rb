class ChangeActivtyTypeTypeToKind < ActiveRecord::Migration[5.2]
  def change
    rename_column :activity_types, :type, :kind
  end
end
