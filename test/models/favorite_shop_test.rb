require 'test_helper'

class FavoriteShopTest < ActiveSupport::TestCase
  def setup
  	@shop = IcecreamShop.new(name: "Test 1", street_address: "Test Address", 
        city: "Berkeley", state: "CA", zipcode: '94612', factual_id: '182305631048109dajfk')
  	@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
	@favorite_shop = FavoriteShop.new(shop_id: @shop.id, user_id: @user.id, rating: nil)
  end

  def teardown
  	@shop = nil
  	@user = nil
  end

  test "should be valid" do 
  	assert @favorite_shop.valid?
  end
end
