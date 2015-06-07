class Api::IcecreamShopsController < ApplicationController
  #before_action :authenticate

  def index
    stores = IcecreamShop.all
    render json: stores, status: 201
    #@stores = self.search -- don't call the api right now
  end

  def new
    @store = IcecreamShop.new
  end
  
  def show
    @store = IcecreamShop.find(params[:id])
  end
  
  def create
    store = IcecreamShop.new(shop_params)
    render json: store, status: 201
  end

  def search
    args_hash = { store_name: params[:store_name], location: params[:location] }
    result = GetFactualData.call(args_hash)
    if result.success?
      search_results = result.results_arr
      render json: search_results, status: 201
    end
  end

  private
    def shop_params
      params.require(:store).permit(:name, :street_address, :city, :state, :zipcode, :factual_id)
    end
end
