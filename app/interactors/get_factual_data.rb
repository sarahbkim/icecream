class GetFactualData
  include Interactor
  require 'factual'

  def call
    factual = Factual.new(FACTUAL_API_KEY, FACTUAL_API_TOKEN)
    raw_data_arr = factual.table("places-us").search(context.store_name).filters("$and" => ["locality": {"$in": [context.location]}, "category_ids":{"$includes_any":[340, 347, 344]}]).rows

    if raw_data_arr.present?
      context.results_arr = []
      raw_data_arr.each do |raw_data|
        shop = createIcecreamShops(raw_data)
        context.results_arr.push(shop)
      end
      context.status = :found
    else
      context.status = :not_found
    end
  end
    
  private
    def createIcecreamShops(raw_data)
      IcecreamShop.create({name: raw_data['name'], street_address: raw_data['address'], city: raw_data['locality'], state: raw_data['region'], zipcode: raw_data['postcode'], factual_id: raw_data['factual_id']})
    end



end
