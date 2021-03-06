require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: {name: "", email: "user@invalid", password: "foo", password_confirmation: "bar"}
    end
    assert_template 'users/new'
    assert_not flash[:success]
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: {name: "Example User", email: "user@example.com", password: "abc123", password_confirmation: "abc123"}
    end
    assert_template 'users/show'
    assert flash[:success]
  end
end
