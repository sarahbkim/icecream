class Api::IcecreamShopsController < ApplicationController
  #before_action :authenticate

  def index
    @stores = self.search
    render json: @stores, status: 201
  end

  def new
    @store = IcecreamShop.new
  end

  def show
    @store = IcecreamShop.find(params[:id])
  end

  def search
    args_hash = { store_name: params[:store_name], location: params[:location] }
    GetFactualData.call(args_hash)
    results = IcecreamShop.where('city like :location_q or name like :name_q', location_q: params[:location], name_q: params[:store_name] ).to_a
    print results
    return results
  end

  private
    def shop_params
      params.require(:store).permit(:name, :street_address, :city, :state, :zipcode, :factual_id)
    end
end