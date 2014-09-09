require 'test_helper'

class AdminPortalTest < ActionDispatch::IntegrationTest
  def login_as_admin
    visit root_path
    click_link('admin login')
    fill_in('admin_email', :with => admins(:pouya).email)
    fill_in('admin_password', :with => 'sekret')
    click_button('Sign in')
  end
  
  test "successul login for admin with correct credentials?" do
    login_as_admin
    assert_equal admin_visits_path, current_path
  end
  
  test "should be able to see the visits records" do
    login_as_admin
    assert page.has_content?(visitors(:Joe).name)
    assert page.has_content?(visitors(:Mike).name)
  end
  
  test "admin should be able to search/filter results in a variety of ways" do
    login_as_admin
    fill_in('q_visitor_name_cont', :with => visitors(:Joe).name)
    click_button('Search')
    
    assert page.has_content?(visitors(:Joe).name)
    assert_equal false, page.has_content?(visitors(:Mike).name)
    within "span.label-primary" do
      assert has_content? '1'
    end
  end
  
  test "searching for a visitor who doesn't exist" do
    login_as_admin
    fill_in('q_visitor_name_cont', :with => "blahblah")
    click_button('Search')
    
    assert page.has_content? 'No Record Matched Your Search Criteria'
  end
end
