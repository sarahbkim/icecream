require 'test_helper'

class IcecreamShopsControllerTest < ActionController::TestCase
  # setup do
  #   @new_shop = icecream_shops(:icis)
  # end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create a shop" do
    assert_difference('IcecreamShop.count') do
      param = {name: 'test_name', street_address: 'test_street_address', city: 'test_city', state: 'test_state', zipcode: 'test_zipcode'}
      post :create, param
    end
  end

end
