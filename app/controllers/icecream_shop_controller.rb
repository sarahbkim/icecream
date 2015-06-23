class IcecreamShopController < ApplicationController
  
  def index
    @shop = IcecreamShop.find(params[:id])
  end

  def favorite
    type = params[:type]
    @shop = IcecreamShop.find(params[:id])
    if type == "favorite"
      @fav = FavoriteShop.create({user_id: current_user.id, shop_id: @shop.id})
      current_user.favorite_shops << @fav
      redirect_to :back, notice: "You favorited #{@shop.name}"
    elsif type == "unfavorite"
      @unfav = FavoriteShop.find_by(user_id: current_user.id, shop_id: @shop.id)
      current_user.favorite_shops.delete(@unfav)
      redirect_to :back, notice: "Unfavorited #{@shop.name}"
    else
      redirect_to :back, notice: "Nothing happened"
    end
  end

  def check_in
    @shop = IcecreamShop.find(params[:id])
    @check = CheckIn.create({user_id: current_user.id, shop_id: @shop.id})
    current_user.check_ins << @check
    redirect_to :back, notice: "You checked in at #{@shop.name}"
  end

end
