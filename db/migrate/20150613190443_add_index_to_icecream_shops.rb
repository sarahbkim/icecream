class AddIndexToIcecreamShops < ActiveRecord::Migration
  def change
    add_index :icecream_shops, :factual_id, unique: true
  end
end
