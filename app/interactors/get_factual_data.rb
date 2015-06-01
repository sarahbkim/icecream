class GetFactualData
  include Interactor
  require 'factual'

  def call
    factual = Factual.new(FACTUAL_API_KEY, FACTUAL_API_TOKEN)
    raw_data_arr = factual.table("places-us").search("ice cream").geo("$circle" => {"$center" => [34.058583, -118.416582], "$meters" => 1000}).rows
    if raw_data_arr.present?
      context.results_arr = []
      raw_data_arr.each do |raw_data|
        context.results_arr.push(IcecreamShop.create({name: raw_data['name'], street_address: raw_data['address'], city: raw_data['locality'], state: raw_data['region'], zipcode: raw_data['postcode']}))
      end
      context.status = :found
    else
      context.status = :not_found
    end
  end

end
