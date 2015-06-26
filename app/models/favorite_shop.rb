class FavoriteShop < ActiveRecord::Base
  belongs_to :user
  belongs_to :icecream_shop

  validates_inclusion_of :rating, :in => 1..5
end
