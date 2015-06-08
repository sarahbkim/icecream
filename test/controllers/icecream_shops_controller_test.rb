require 'test_helper'

class Api::IcecreamShopsControllerTest < ActionController::TestCase
  setup do
    @valid_params = {name: 'test_name', street_address: 'test_street_address', city: 'test_city', state: 'test_state', zipcode: 91913, factual_id: '183920156084391'}
    @invalid_params = {name: 'test_name', street_address: 'test_street_address', city: 12, state: 'test_state', zipcode: 'xxx', factual_id: nil}
  end

  test "should search factual API with valid args and update my db" do 
    get :search, store_name: "", location: "Berkeley"
    assert_response :success

    assert_difference('IcecreamShop.count') do
      get :search, store_name: "Smitten", location: "Oakland"
      assert_response :success
    end

  end
  
end

# [{"id":1,"name":"Smitten Ice Cream","street_address":"5800 College Ave","city":"Oakland","state":"CA","zipcode":94618,"created_at":"2015-06-07T22:13:16.732Z","updated_at":"2015-06-07T22:13:16.732Z","factual_id":"d45e5b44-d751-4040-b921-2bb543eac1c0"}]