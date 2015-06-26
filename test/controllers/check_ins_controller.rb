require 'test_helper'

class CheckInsControllerTest < ActionController::TestCase
	setup do 
		@check_in = {user_id: 1, shop_id: 1}
	end

	test 'should get index' do 
		get :index
		assert_response :success
	end

	test 'should create new' do
		get :new
		assert_response :success
	end

	test 'should create new check in' do
		assert_difference('FavoriteShop.count') do
			post :create, check_in: @check_in
		end
	end

end