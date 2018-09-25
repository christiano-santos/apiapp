class ChangeDataTypeForLongtext < ActiveRecord::Migration[5.2]
  def change
    change_column :ads, :description, :longtext
  end
end
