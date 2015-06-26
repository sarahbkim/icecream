require 'test_helper'

class FavoriteShopTest < ActiveSupport::TestCase
  def setup
  	@shop = IcecreamShop.new(name: "Test 1", street_address: "Test Address", 
        city: "Berkeley", state: "CA", zipcode: '94612', factual_id: '182305631048109dajfk')
  	@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
	@favorite_shop = FavoriteShop.new(shop_id: @shop.id, user_id: @user.id, rating: 1)
  end

  def teardown
  	@shop = nil
  	@user = nil
  end

  test "should be valid" do 
  	assert @favorite_shop.valid?
  end

  test "valid rating should be valid" do
    (1..5).to_a.each do |x|
      @favorite_shop.rating = x
      assert @favorite_shop.valid?
    end
  end

  test "invalid rating should not be valid" do
    5.times do
      @favorite_shop.rating = rand
      assert_not @favorite_shop.valid?
    end
  end
end
