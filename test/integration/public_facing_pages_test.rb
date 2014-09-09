require 'test_helper'

class PublicFacingPagesTest < ActionDispatch::IntegrationTest
  test "home page should have the right header(s) and buttons" do
    visit root_url
    
    assert_equal true, has_content?('Welcome to F-Secure')
    within("h2") do
      assert has_content? 'Digital Visitor Registry Book'
    end
    page.has_selector?(:xpath, '//a[contains(@class, "register-btn")]', :count => 2)
  end
  
  test "font awesome cdn & bootstrap js are on the page" do
    visit root_url
    
    # assert has_xpath?('//link[contains(@href, "//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css")]', :count => 1)
    page.has_selector?(:xpath, '//script[contains(@src, "bootstrap.js")]')
    page.has_selector?(:xpath, '//link[contains(@href, "font-awesome.css")]')
  end
end
