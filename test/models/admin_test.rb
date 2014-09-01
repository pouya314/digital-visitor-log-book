require 'test_helper'

# 
# Note:
# ––––––
# Admin model (or any other authenticatable model provided by devise) is probably extensively tested by devise itself.
# including the following tests just for the sake of testing. :)
# 

class AdminTest < ActiveSupport::TestCase
  test "email and password fields are both mandatory" do
    new_admin = Admin.new
    
    assert new_admin.invalid?
    assert_equal false, new_admin.save
  end
  
  test "admin email field should be unique" do
    new_admin = Admin.new(
      :email    => admins(:pouya).email,
      :password => "password"
    )
    
    assert_equal false, new_admin.save
    assert_equal "has already been taken", new_admin.errors[:email][0]
  end
  
  test "ok new admin" do
    new_admin = Admin.new(
      :email    => "john@smith.com",
      :password => "password"
    )
    
    assert new_admin.valid?
    assert_equal true, new_admin.save
  end
end
