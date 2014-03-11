class Visitor < ActiveRecord::Base
  validates :name, :photo, :department, :email, :phone, :reason, presence: true
end
