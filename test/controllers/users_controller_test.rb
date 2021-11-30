require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

   test "should get index if signed in" do
     sign_in users(:one)

     get users_index_url
     assert_response :success
   end

   test "should redirect if not signed in" do
     sign_out :user

     get users_index_url
     assert_response :found
   end
end
