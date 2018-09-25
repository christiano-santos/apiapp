class CreateAds < ActiveRecord::Migration[5.2]
  def change
    create_table :ads do |t|
      t.string :establishment
      t.string :description 

      t.timestamps
    end
  end
end
