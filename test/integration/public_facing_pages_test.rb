require 'test_helper'

class PublicFacingPagesTest < ActionDispatch::IntegrationTest
  test "home page should have the right content" do
    visit root_url
    
    assert_equal true, has_content?('Welcome to F-Secure')
    within("h2") do
      assert has_content? 'Digital Visitor Registry Book'
    end
  end
end
