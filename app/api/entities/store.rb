module Entities
  class Store < Grape::Entity
  	expose :address, using: :Address
  	expose :organization, using: :Organization
  	expose :title, documentation: { type: 'string', desc: 'title of the store' }
  	expose :opening_hours, documentation: { type: 'string', desc: 'hours in which the store is open' }
  end
end