class AddAverageRatingToIceCreamShop < ActiveRecord::Migration
  def change
  	add_column :icecream_shops, :avg_rating, :float
  end
end
