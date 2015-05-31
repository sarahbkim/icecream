require 'test_helper'

class IcecreamShopTest < ActiveSupport::TestCase
  def setup
    @shop = IcecreamShop.new(name: "Icis", street_address: "3224 College Avenue", 
        city: "Berkeley", state: "CA", zipcode: '94612')
  end

  test "should be valid" do
    assert @shop.valid?
  end

  test "name should be present" do
    @shop.name = " " * 3
    assert_not @shop.valid?
  end

  test "street_address should be present" do
    @shop.street_address = " " * 3
    assert_not @shop.valid?
  end

  test "zipcode should be in correct format" do
    valid_zips = [94612, 91913]
    valid_zips.each do |zip|
      @shop.zipcode = zip
      assert @shop.valid?, "#{zip} should be in the right format"
    end
  end

  test "zipcode should not be in incorrect formats" do
    invalid_zips = [32, 'a21432', 9124]
    invalid_zips.each do |zip|
      @shop.zipcode = zip
      assert_not @shop.valid?
    end
  end
end
