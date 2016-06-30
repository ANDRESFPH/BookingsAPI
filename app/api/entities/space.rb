module Entities
  class Space < Grape::Entity
  	expose :store, using: Entities::Store
  	expose :title, documentation: { type: 'string', desc: 'title of the space' }
  	expose :size, documentation: { type: 'string', desc: 'size of the space' }
  	expose :price_per_day, documentation: { type: 'decimal', desc: 'price of the space per day' }
  	expose :price_per_week, documentation: { type: 'decimal', desc: 'price of the space per week' }
  	expose :price_per_month, documentation: { type: 'decimal', desc: 'price of the space per month' }
  end
end