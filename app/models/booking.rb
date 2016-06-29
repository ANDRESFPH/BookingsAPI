class Booking < ActiveRecord::Base
	has_one :space
	has_one :organization	
	validates :start_date, :end_date, :price, presence: true
	validates :price, numericality: true  
	validates_associated :space, :organization
end
