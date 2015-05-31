class CreateFavoriteShops < ActiveRecord::Migration
  def change
    create_table :favorite_shops do |t|
      t.string :store_name
      t.string :city
      t.integer :rating
      t.string :shop_id
      t.string :user_id
      t.timestamps null: false
    end
  end
end
