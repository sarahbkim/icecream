class FavoriteShop < ActiveRecord::Base
  validates :store_name, presence: true
  validates :city, presence: true
  validates :rating, presence: true
  validates :shop_id, presence: true
  validates :user_id, presence: true
end
