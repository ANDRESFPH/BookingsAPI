module Entities
  class Store < Grape::Entity  	
  	expose :title, documentation: { type: 'string', desc: 'title of the store' }
  	expose :opening_hours, documentation: { type: 'string', desc: 'hours in which the store is open' }
  	expose :organization, using: Entities::Organization
  	expose :address, using: Entities::Address
  end
end