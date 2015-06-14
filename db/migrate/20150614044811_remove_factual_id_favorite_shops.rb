class RemoveFactualIdFavoriteShops < ActiveRecord::Migration
  def change
      remove_column :favorite_shops, :factual_id, :string
  end
end
