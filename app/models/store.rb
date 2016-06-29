class Store < ActiveRecord::Base
	belongs_to :address
	has_many :spaces
	belongs_to :organization

	validates :title, :opening_hours, presence:true
	#validates_associated :spaces, :address
end
