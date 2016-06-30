class Space < ActiveRecord::Base
	belongs_to :store
	has_many :bookings

	validates :title, :size, :price_per_day, :price_per_week, :price_per_month, presence: true
end
