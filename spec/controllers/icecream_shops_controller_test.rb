require 'test_helper'

class IcecreamShopsControllerTest < ActionController::TestCase
  setup do
    @valid_params = {name: 'test_name', street_address: 'test_street_address', city: 'test_city', state: 'test_state', zipcode: 91913}
    @invalid_params = {name: 'test_name', street_address: 'test_street_address', city: 12, state: 'test_state', zipcode: 'xxx'}
  end

  test "should show a list of results from Factual data" do
    get :index
    assert_response :success
  end

  test "should search factual API with valid args" do 
    get :search, store_name: "", location: "Berkeley"
    assert_response :success

    get :search, store_name: "Smitten", location: "Oakland"
    assert_response :success
  end
  
  # test "should create a shop with valid input" do
  #   assert_difference('IcecreamShop.count') do
  #     post :create, :store => @valid_params
  #   end

  #   assert_no_difference('IcecreamShop.count') do
  #     post :create, :store => @invalid_params
  #   end
  # end

end
