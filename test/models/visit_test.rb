require 'test_helper'

class VisitTest < ActiveSupport::TestCase
  test "ALL fields need to be provided - mandatory" do
    mike          = visitors(:Mike)
    visit         = Visit.new
    visit.visitor = mike
    assert visit.invalid?, "all fields are mandatory"
    
    visit.save
    assert_equal "can't be blank", visit.errors[:from_company][0]
  end
  
  test "just an example: from_company field/column of visit model is mandatory" do
    v              = visits(:MikeVisit01)
    v.from_company = ""
    assert v.invalid?
    v.save
    assert v.errors[:from_company].any?
  end
  
  def give_me_invalid_visit_with_wrong_company_to_visit_field
    v                  = visits(:MikeVisit01)
    v.company_to_visit = "Some Other Company Name"
    return v
  end
  
  test "company_to_visit can be 1 of 3 values only" do
    v = give_me_invalid_visit_with_wrong_company_to_visit_field
    assert v.invalid?, "Inclusion validation failed."
  end
  
  test "company_to_visit error message" do
    v = give_me_invalid_visit_with_wrong_company_to_visit_field
    v.save
    assert_equal "is not included in the list", v.errors[:company_to_visit][0]
  end
  
  test "company_to_visit with a bunch of bad values" do
    bad = ["FSec", "FSecure", "F_Secure", "Home-Guru", "HomeGuru", "Bessedo"]
    bad.each do |bad_value|
      v = visits(:MikeVisit01)
      v.company_to_visit = bad_value
      assert v.invalid?, "bad value for company_to_visit field."
    end
  end
  
  test "company_to_visit correct value should be persisted" do
    a_valid_visit                  = visits(:MikeVisit02)
    a_valid_visit.company_to_visit = "Home Guru"
    
    assert a_valid_visit.valid?
    assert_equal true, a_valid_visit.save
  end
end
