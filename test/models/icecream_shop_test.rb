require 'test_helper'

class IcecreamShopTest < ActiveSupport::TestCase
  def setup
    @shop = IcecreamShop.new(name: "Test 1", street_address: "Test Address", 
        city: "Berkeley", state: "CA", zipcode: '94612', factual_id: '182305631048109dajfk')
  end

  def teardown
    @shop = nil
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
    valid_zips = ['94612', '91913', '02105']
    valid_zips.each do |zipcode|
      @shop.zipcode = zipcode
      assert @shop.valid?, "#{zipcode} should be in the right format"
    end
  end

  test "zipcode should not be in incorrect formats" do
    invalid_zips = [32, 'a21432', 9124]
    invalid_zips.each do |zip|
      @shop.zipcode = zip
      assert_not @shop.valid? "#{zip} should be in the right format"
    end
  end
end
