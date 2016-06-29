class Space < ActiveRecord::Base
	belongs_to :store
	belongs_to :booking

	validates :title, :price_per_day, :price_per_week, :price_per_month, presence: true
end
