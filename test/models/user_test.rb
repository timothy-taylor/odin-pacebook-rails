require "test_helper"

class UserTest < ActiveSupport::TestCase
   test "the truth" do
     assert true
   end

   test "blank user should fail validation" do
     u = User.new
     assert_not u.valid?
   end
end
