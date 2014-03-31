class Visitor < ActiveRecord::Base
  has_many :visits, :dependent => :destroy
  accepts_nested_attributes_for :visits
  
  validates :name, :photo, presence: true
end
