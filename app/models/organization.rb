class Organization < ActiveRecord::Base
	has_many :stores
	belongs_to :booking

	validates :title, :description, :org_type, presence: true
end
