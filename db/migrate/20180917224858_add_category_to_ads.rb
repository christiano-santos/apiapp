class AddCategoryToAds < ActiveRecord::Migration[5.2]
  def change
    add_reference :ads, :category, foreign_key: true
  end
end
