class FavoriteShop < ActiveRecord::Base
  belongs_to :user
  belongs_to :icecream_shop
end
