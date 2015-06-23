require 'test_helper'

class UsersControllerTest < ActionController::TestCase
	setup do
		@user = { name: 'test', email: 'test@test.com', password: 'abc123', password_confirmation: 'abc123' }
		@user2 = {name: 'test2', email: 'invalidemail', password: 'abc123', password_confirmation: 'abc123'}
  end

	
  test 'should get new' do
		get :new
		assert_response :success
  end

  test 'should show a single user page' do 
  	@current_user = User.create(@user)
		get :show, id: @current_user.id
		assert_response :success
  end

  test 'should create a new user' do 
  	assert_difference('User.count') do
	  	post :create, user: @user
	  end
  end

  test 'should not create a new user with invalid params' do 
  	assert_no_difference('User.count') do 
  		post :create, user: @user2
  	end
  end
end
