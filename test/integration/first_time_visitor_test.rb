require 'test_helper'

class FirstTimeVisitorTest < ActionDispatch::IntegrationTest
  def go_to_first_time_registration_page
    visit root_path
    click_link('First time visitor')
  end
  
  test "should not be able to register without providing required data" do
    go_to_first_time_registration_page
    click_button('Submit')
    
    assert page.has_selector?('div#error_explanation')
    assert page.has_content?('All fields are mandatory')
  end
  
  test "visitor should be able to register with all data provided" do
    skip
    go_to_first_time_registration_page
    
    # provide some sample image data
    assert page.has_selector?('a#startbutton')
    # page.find("#startbutton").click
    # page.find(".btn-looking-good").click
    page.click_link('startbutton')
    page.click_link('ok')
    
    fill_in('visitor_name', :with => "Martin")  
    fill_in('visitor_visits_attributes_0_from_company', :with => "ztory")
    fill_in('visitor_visits_attributes_0_person_to_meet', :with => "Pouya")
    select('F-Secure', :from => 'visitor_visits_attributes_0_company_to_visit')
    click_button('Submit')
    
    assert_equal root_path, current_path
    assert page.has_content?('You may now proceed')
  end
end
