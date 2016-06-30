module Entities
  class Store < Grape::Entity  	
  	expose :title, documentation: { type: 'string', desc: 'title of the store' }
  	expose :opening_hours, documentation: { type: 'string', desc: 'hours in which the store is open' }
  	expose :organization, using: :Organization
  	expose :address, using: :Address
  end
end