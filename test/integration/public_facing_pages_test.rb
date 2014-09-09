require 'test_helper'

class PublicFacingPagesTest < ActionDispatch::IntegrationTest
  test "home page should have the right header(s) and buttons" do
    visit root_url
    
    assert_equal true, has_content?('Welcome to F-Secure')
    within("h2") do
      assert has_content? 'Digital Visitor Registry Book'
    end
    assert page.has_selector?(:xpath, '//a[contains(@class, "register-btn")]', :count => 2)
  end
  
  test "font awesome cdn & bootstrap js are on the page" do
    visit root_url
    
    # assert page.has_xpath?('.//script[contains(@src, "bootstrap.js")]')
    # assert page.has_xpath?('//link[contains(@href, "font-awesome.css")]')
  end
  
  test "returning visitor page" do
    visit root_url
    click_link('Returning visitor')
    assert_equal index_returning_path, current_path
    assert page.has_selector?('form.visitor_search')
    assert page.has_link?('Back')
    click_link('Back')
    assert_equal root_path, current_path
  end
  
  test "first time visitor registration page" do
    visit root_url
    click_link('First time visitor')
    assert_equal new_visitor_path, current_path
    assert has_selector?('div.page-header')
    within('div.page-header') do
      assert has_content? 'Registration'
    end
    assert page.has_selector?('form.new_visitor')
  end
  
  test "admin link on root url" do
    visit root_url
    assert has_link?('admin login')
  end
end
