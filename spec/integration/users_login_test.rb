# require 'test_helper'

# class UsersLoginTest < ActionDispatch::IntegrationTest
  
#   test "login with invalid information" do
#     get login_path
#     assert_template 'sessions/new'
#     post login_path, session: {email: "", password: ""}  
#     assert_template 'sessions/new'
#     assert_not flash.empty?
#     get root_path
#     assert flash.empty?
#   end

#   test "loging with valid information" do
#     get login_path
#     assert_template 'sessions/new'
#     post login_path, session: {email: "pnkdaegee@gmail.com", password: "abc123"}
#     assert_template 'sessions/new'
#     assert_not flash.empty?
#   end
# end
