require 'test_helper'

class VisitorTest < ActiveSupport::TestCase
  def give_me_a_valid_visitor
    Visitor.new(name: "John Smith", photo: "SomeString")
  end
  
  def assoc_a_valid_visit_to(visitor)
    visitor.visits.build(
      :from_company     => "Experian",
      :person_to_meet   => "MacNelly",
      :company_to_visit => "Besedo"
    )
    return visitor
  end
  
  def give_me_a_valid_association
    v = give_me_a_valid_visitor
    assoc_a_valid_visit_to(v)
    return v
  end
  
  test "all fields are mandatory" do
    invalid_visitor = Visitor.new
    assoc_a_valid_visit_to(invalid_visitor)
    
    assert invalid_visitor.invalid?
    assert_no_difference 'Visitor.count' do
      invalid_visitor.save
    end
  end
  
  test "when all fields are provided, record should be successfully persisted" do
    valid_visitor  = give_me_a_valid_association

    assert valid_visitor.valid?
    assert_difference 'Visitor.count', +1 do
      valid_visitor.save
    end
  end
  
  test "when all fields are provided, not only visitor instance but also the associated visit instance should be persisted too" do
    assert_difference 'Visit.count', +1 do
      give_me_a_valid_association.save
    end
  end
  
  test "when a visitor record is destroyed, all associated/dependent visit record should also be destroyed" do
    my_visitor_to_be_destroyed = give_me_a_valid_association
    my_visitor_to_be_destroyed.save
    
    assert_difference 'Visit.count', -1 do
      my_visitor_to_be_destroyed.destroy
    end
  end
end
