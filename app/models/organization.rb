class Organization < ActiveRecord::Base
	has_many :stores
	has_many :bookings

	validates :title, :description, :org_type, presence: true
end
