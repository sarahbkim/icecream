require 'test_helper'

class Api::IcecreamShopsControllerTest < ActionController::TestCase
  test "should show a list of results from Factual data" do
    get :index
    assert_response :success
    assert JSON.parse(response.body), [{"id"=>281600645, "name"=>"Icis", "street_address"=>"3555 College Ave", "city"=>"Berkeley", "state"=>"CA", "zipcode"=>"94612", "created_at"=>"2015-06-06T22:09:28.000Z", "updated_at"=>"2015-06-06T22:09:28.000Z", "factual_id"=>nil}, {"id"=>711149028, "name"=>"SweetHeart Cafe", "street_address"=>"100 W Grand Ave", "city"=>"Oakland", "state"=>"CA", "zipcode"=>"94012", "created_at"=>"2015-06-06T22:09:28.000Z", "updated_at"=>"2015-06-06T22:09:28.000Z", "factual_id"=>nil}]
  end

end