class Store < ActiveRecord::Base
	has_one :address
	has_many :spaces
	belongs_to :organization

	validates :title, :opening_hours, presence:true
	validates_associated :space, :address
end
