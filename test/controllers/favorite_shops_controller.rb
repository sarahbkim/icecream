require 'test_helper'

class FavoriteShopsControllerTest < ActionController::TestCase
	setup do 
		@favorite_shop = {rating: 1, shop_id: 1, user_id: 1, factual_id: '12385210382'}
	end

	test 'should get new' do 
		get :new
		assert_response :success
	end	

	test 'should create a new favorite shop' do 
		assert_difference('FavoriteShop.count') do
			post :create, favorite_shop: @favorite_shop
		end
	end

end