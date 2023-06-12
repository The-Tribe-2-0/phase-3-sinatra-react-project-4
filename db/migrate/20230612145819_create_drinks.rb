class CreateDrinks < ActiveRecord::Migration[6.1]
  def change
    create_table :drinks do |t|
      t.string :name
      t.integer :category_id
      t.integer :user_id
      t.string :brand
      t.string :image_url

      t.timestamps
    end
  end
end
