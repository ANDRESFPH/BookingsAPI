class Address < ActiveRecord::Base
	belongs_to :store	
	validates :street, :city, :country, presence: true
end
