class GetFactualData
  include Interactor
  require 'factual'

  def call
    factual = Factual.new(FACTUAL_API_KEY, FACTUAL_API_TOKEN)
    if context.store_name == ""
      context.store_name = "ice cream"
    end

    if context.location == ""
      raw_data_arr = factual.table("places-us").search(context.store_name).filters("category_ids":{"$includes_any":[340, 347, 344]}).rows
    else
      raw_data_arr = factual.table("places-us").search(context.store_name).filters("$and" => ["locality": {"$in": [context.location]}, "category_ids":{"$includes_any":[340, 347, 344]}]).rows
    end

    if raw_data_arr.present?
      context.results_arr = processResults(raw_data_arr)
      context.status = :found
    else
      context.status = :not_found
    end
  end

  private

    def processResults(raw_data)
      results_arr = []

      raw_data.each do |data|
        shop = createIcecreamShops(data)
        results_arr.push(shop)
      end

      return results_arr
    end

    def createIcecreamShops(raw_data)
      IcecreamShop.create({name: raw_data['name'], street_address: raw_data['address'], city: raw_data['locality'], state: raw_data['region'], zipcode: raw_data['postcode'], factual_id: raw_data['factual_id']})
    end

end
