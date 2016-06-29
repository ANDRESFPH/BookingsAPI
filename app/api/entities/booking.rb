module Entities
  class Booking < Grape::Entity
  	expose :space, using: :Space
  	expose :organization, using: :Organization
  	expose :start_date, documentation: { type: 'timestamp', desc: 'the start date for thebooking' }
  	expose :end_date, documentation: { type: 'timestamp', desc: 'the end date for thebooking' }
  	expose :price, documentation: { type: 'decimal', desc: 'price of the space for the booking dates' }
  end
end