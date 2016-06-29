module Entities
  class Address < Grape::Entity
  	expose :street, documentation: { type: 'string', desc: 'street name' }
  	expose :zip, documentation: { type: 'string', desc: 'zip code' }
  	expose :city, documentation: { type: 'string', desc: 'name of the city' }
  	expose :country, documentation: { type: 'string', desc: 'country name' }
  end
end