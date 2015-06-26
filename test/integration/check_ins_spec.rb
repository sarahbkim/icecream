require 'test_helper'

class CheckInsTest < ActionDispacth::IntegrationTest
	test "icecream shop detail page should have check_in link" do 
		get icecream_shop_path, id: 1
		assert_template 'icecream_shop/index'
		assert_difference 'CheckIns.count', 1 do
			get check_in_path
			assert_template 'icecream_shop/index'
		end
	end
end

