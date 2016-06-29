class Address < ActiveRecord::Base
	has_one :store
	validates :street, :city, :country, presence: true
end
