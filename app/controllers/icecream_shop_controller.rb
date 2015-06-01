class IcecreamShopsController < ApplicationController
  def new
    # @store = IcecreamShop.new
  end

  def show
    # @store = IcecreamShop.find(params[:id])
  end

  def create
    # @store = IcecreamShop.new(store_params)
  end

  private
    def store_params
      params.require(:icecreamshop).permit(:name, :street_address, :city, :state, :zipcode)
    end
end
