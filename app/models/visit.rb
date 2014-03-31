class Visit < ActiveRecord::Base
  belongs_to :visitor
  
  validates :from_company, :person_to_meet, :company_to_visit, presence: true
end
