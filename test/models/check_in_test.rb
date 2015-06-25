require 'test_helper'

class CheckInTest < ActiveSupport::TestCase
 def setup
  	@shop = IcecreamShop.new(name: "Test 1", street_address: "Test Address", 
        city: "Berkeley", state: "CA", zipcode: '94612', factual_id: '182305631048109dajfk')
  	@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
	@check_in = CheckIn.new(shop_id: @shop.id, user_id: @user.id)
  end

  def teardown
  	@shop = nil
  	@user = nil
  end

  test "should be valid" do
  	assert @check_in.valid?
  end
end
