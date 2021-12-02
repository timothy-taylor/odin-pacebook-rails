require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

   test "get index if signed in" do
     sign_in users(:one)

     get users_path
     assert_response :success
   end

   test "redirect if not signed in" do
     sign_out :user

     get users_path
     assert_response :found
   end

   test "show user" do
     sign_in users(:one)

     get users_path(User.first)
     assert_response :success
   end
end
