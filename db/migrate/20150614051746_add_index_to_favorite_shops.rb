class AddIndexToFavoriteShops < ActiveRecord::Migration
  def change
    add_index :favorite_shops, [:shop_id,  :user_id], unique: true
  end
end
