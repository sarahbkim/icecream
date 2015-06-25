require 'test_helper'

class FavoriteShopsTest < ActionDispatch::IntegrationTest
	setup do
		@shop_params = {name: 'test_name', street_address: 'test_street_address', city: 'test_city', state: 'test_state', zipcode: 91913, factual_id: '183920156084391', id: 1}
		@shop = IcecreamShop.create(@shop_params)
		@shop.save

		@user = { name: 'test', email: 'test@test.com', password: 'abc123', password_confirmation: 'abc123' }
		@current_user = User.create(@user)
	end

	teardown do
		@shop.delete
		@current_user = nil
	end

	test 'icecream shop detail page should have check_in link for logged in users' do 
		#login
		get login_path
    post login_path, session: {email: @current_user.email, password: @current_user.password}
		
    #navigate to an icecreamshop detail page
		get icecream_shop_path(@shop, @shop.id)
		assert_template 'icecream_shop/show'
		assert_select 'div #icecreamShopDetail a', {count: 1, text: 'Add to Favorites'}
	end

	test 'shop detail page should not have check_in link for logged out users' do
		get icecream_shop_path(@shop, @shop.id)
		assert_template 'icecream_shop/show'
		assert_select 'div #icecreamShopDetail a', {count: 0, text: 'Add to Favorites'}
	end
end

