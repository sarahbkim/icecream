class FavoriteShopController < ApplicationController
  def new
    @favorite_shop = FavoriteShop.new
  end

  def create
    @favorite_shop = FavoriteShop.new(favorite_shop_params)
  end

  private
    def favorite_shop_params
      params.require(:favorite_shop).permit(:rating, :shop_id, :user_id, :factual_id)
    end
end
