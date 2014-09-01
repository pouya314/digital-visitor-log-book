class Visit < ActiveRecord::Base
  belongs_to :visitor
  
  validates :from_company, :person_to_meet, :company_to_visit, presence: true
  validates :company_to_visit, inclusion: { in: ["F-Secure", "Home Guru", "Besedo"] }
end
