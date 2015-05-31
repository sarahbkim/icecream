class ChangeShopIdAndUserIdInFavoriteShops < ActiveRecord::Migration
  def change
    change_column :favorite_shops, :user_id, :integer
    change_column :favorite_shops, :shop_id, :integer
    remove_column :favorite_shops, :store_name, :string
    remove_column :favorite_shops, :city, :string
  end
end
