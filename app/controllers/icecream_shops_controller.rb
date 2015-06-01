class IcecreamShopsController < ApplicationController
  def index
    @stores = IcecreamShop.all
  end

  def new
    @store = IcecreamShop.new
  end
  
  def show
    @store = IcecreamShop.find(params[:id])
  end
  
  def create
    @store = IcecreamShop.new(shop_params)
    @store.save
  end

  private
    def shop_params
      params.require(:store).permit(:name, :street_address, :city, :state, :zipcode)
    end
end
