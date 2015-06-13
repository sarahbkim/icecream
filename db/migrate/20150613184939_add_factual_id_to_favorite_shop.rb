class AddFactualIdToFavoriteShop < ActiveRecord::Migration
  def change
    add_column :favorite_shops, :factual_id, :string
  end
end
