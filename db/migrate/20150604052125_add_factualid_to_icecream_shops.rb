class AddFactualidToIcecreamShops < ActiveRecord::Migration
  def change
    add_column :icecream_shops, :factual_id, :string
  end
end
