require 'test_helper'

class ReturningVisitorTest < ActionDispatch::IntegrationTest
  test "returning visitor should be able to find his record in the system" do
    visit root_url
    click_link('Returning visitor')
    fill_in('q_name_cont', :with => visitors(:Joe).name)
    click_button('Search')
    assert page.has_content?(visitors(:Joe).name)
  end
  
  test "random visitor should not be able to find his record in the system" do
    visit root_url
    click_link('Returning visitor')
    fill_in('q_name_cont', :with => 'some random name')
    click_button('Search')
    assert page.has_selector?('span.text-danger')
    within 'span.text-danger' do
      assert has_content?('No visitor found with that name! please try again.')
    end
  end
end
