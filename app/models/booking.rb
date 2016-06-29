class Booking < ActiveRecord::Base
	belongs_to :space
	belongs_to :organization	
	validates :start_date, :end_date, :price, presence: true
	validates :price, numericality: true  
end
