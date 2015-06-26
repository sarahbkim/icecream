require 'test_helper'

class IcecreamShopTest < ActionDispatch::IntegrationTest
	setup do
		@shop_params = {name: 'test_name', street_address: 'test_street_address', city: 'test_city', state: 'test_state', zipcode: 91913, factual_id: '183920156084391', id: 1}
		@shop = IcecreamShop.create(@shop_params)
		@shop.save

		@user = { name: 'test', email: 'test@test.com', password: 'abc123', password_confirmation: 'abc123' }
		@current_user = User.create(@user)

		# login
		get login_path
		post login_path, session: {email: 'test@test.com', password: 'abc123'}
	end

	teardown do
		@shop.delete
		@current_user.favorite_shops.delete_all
		@current_user = nil
	end

	test "logged in home page should have search form" do 
		get login_path
		post login_path, session: {email: 'test@test.com', password: 'abc123'}
		get root_path
		assert_template 'static_pages/home'
	end

	test "logged out home page should not have search form" do 
		get root_path
		assert_template 'static_pages/home'
	end

	test 'should add shop to favorites' do
		#navigate to an icecreamshop detail page
		get icecream_shop_path(@shop, @shop.id)
		assert_template 'icecream_shop/show'

		#add a shop to favorites
		put favorite_icecream_shop_path(@shop, type: 'favorite')
		assert_not_nil @current_user.favorite_shops.find_by(shop_id: @shop.id)

		get icecream_shop_path(@shop, @shop.id)

		#make sure link is updated
		assert_select 'div #icecreamShopDetail a', {count: 1, text: 'Remove from favorites'}
	end

	test 'should remove shop from favorites' do
		#navigate to an icecreamshop detail page
		get icecream_shop_path(@shop, @shop.id)
		assert_template 'icecream_shop/show'
		
		#add a shop to favorites
		put favorite_icecream_shop_path(@shop, type: 'favorite')
		assert_not_nil @current_user.favorite_shops.find_by(shop_id: @shop.id)
		get icecream_shop_path(@shop, @shop.id)

		#remove shop from favorites
		put favorite_icecream_shop_path(@shop, type: 'unfavorite')
		assert_nil @current_user.favorite_shops.find_by(shop_id: @shop.id)
	end

	test 'should be able to check into a store' do
		#navigate to an icecreamshop detail page
		get icecream_shop_path(@shop, @shop.id)
		assert_template 'icecream_shop/show'

		#check in to a store
		put check_in_icecream_shop_path(@shop)
		@created_date = Time.now
		assert_not_nil @current_user.check_ins.where(shop_id: @shop.id, created_date: @created_at)
	end

end