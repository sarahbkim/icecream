class IcecreamShopController < ApplicationController
  def show
    @shop = IcecreamShop.find(params[:id])
  end
end
