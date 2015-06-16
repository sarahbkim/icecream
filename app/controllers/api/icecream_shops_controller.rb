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
    # search in app's database first
    results = IcecreamShop.where('city like :location_q or name like :name_q', location_q: params[:location], name_q: params[:store_name] ).to_a
    print (results.empty?)
    # if no results, call in Factual api
    if results.empty?
      args_hash = { store_name: params[:store_name], location: params[:location] }
      results = GetFactualData.call(args_hash)
      print results.results_arr
      if results.success?
        return results.results_arr
      end
    else
      return results
    end
  
  end

  private
    def shop_params
      params.require(:store).permit(:name, :street_address, :city, :state, :zipcode, :factual_id)
    end
end
