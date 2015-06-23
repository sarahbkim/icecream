require 'test_helper'

class Api::IcecreamShopsControllerTest < ActionController::TestCase
  setup do
    @valid_params = {name: 'test_name', street_address: 'test_street_address', city: 'test_city', state: 'test_state', zipcode: 91913, factual_id: '183920156084391'}
    @invalid_params = {name: 'test_name', street_address: 'test_street_address', city: 12, state: 'test_state', zipcode: 'xxx', factual_id: nil}
  end

  test "API's index shold return response valid args" do 
    get :index, store_name: "", location: "Berkeley"
    assert_response :success

    get  :index, store_name: "Coldstone", location: ""
    assert_response :success

    get :index, store_name: "Coldstone", location: "San Francisco"
    assert_response :success
  end

  test "search method should return an array of results" do
    s = Api::IcecreamShopsController.new
    s.params = {store_name: "", location: "Oakland"}
    results = s.search
    assert_not_empty results
  end

end