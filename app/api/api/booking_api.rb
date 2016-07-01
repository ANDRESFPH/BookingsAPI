class API::BookingApi < Grape::API

  #Api Format, configures the format to json
  format :json
  default_format :json


  resource :bookings do

  	desc 'Return all the Bookings'
  	get do
  	  result = Bookings::GetBookings.call
      error!(result.error, :not_found) if result.failure?
      present result.stores, with: Entities::Booking
  	end


  	desc 'Return a Booking'
  	params do
  	  requires :id, 
                type: Integer, 
                desc: 'Booking id',
                values: (1..1_000_000)
  	end
  	route_param :id do
  	  get do
  	    result = Bookings::GetBookings.call(booking_id: params[:id])
  	    error!(result.error, :not_found) if result.failure?
        Entities::Booking.represent(result.booking)
  	  end
  	end 


  	desc 'Create a Booking'
  	params do
  		requires :start_date, 
  				      type: String,
  				      desc: 'starting date for the booking'
  		requires :end_date,
  				      type: String,
  				      desc: 'final date for the booking'
      requires :price,
                type: Integer,
                desc: 'price for the booking'
      requires :organization_id,
                type: Integer,
                desc: 'id of the organization'
      requires :space_id,
                type: Integer,
                desc: 'id of the space'
  	end
  	post do
  	  result = Bookings::CreateBooking.call(start_date: params[:start_date],
                                    end_date: params[:end_date],
                                    price: params[:price],
                                    organization_id: params[:organization_id],
                                    space_id: params[:space_id] )
  	  error!(result.error, :unprocessable_entity) if result.failure? 
  	end


    desc 'update a Booking'
    params do
      requires :start_date, 
                type: String,
                desc: 'title of the store'
      requires :end_date,
                type: String,
                desc: 'name of the city'
      requires :price,
                type: Integer,
                desc: 'address id'
      requires :organization_id,
                type: Integer,
                desc: 'id of the organization'
      requires :space_id,
                type: Integer,
                desc: 'id of the organization'
    end
    route_param :id do
      put do
        result = Bookings::UpdateBooking.call(start_date: params[:start_date],
                                    end_date: params[:end_date],
                                    price: params[:price],
                                    organization_id: params[:organization_id],
                                    space_id: params[:space_id],
                                    booking_id: params[:id] )
        error!(result.error, :unprocessable_entity) if result.failure? 
      end
    end
    

    desc 'Delete a Booking'
    params do
      requires :id,
                type: Integer, 
                desc: 'Address ID.',
                values: (1..1_000_000)
    end
    route_param :id do
      delete do
        result = Bookings::GetBookings.call(booking_id: params[:id])
        error!(result.error, :unprocessable_entity) if result.failure? 
      end
    end
    
    
  end
end