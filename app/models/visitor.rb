class Visitor < ActiveRecord::Base
  # validates :name, :photo, :department, :email, :phone, :reason, presence: true
  has_many :visits, :dependent => :destroy
end
