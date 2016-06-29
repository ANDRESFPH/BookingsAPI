class API::AddressApi < Grape::API

  #Api Format, configures the format to json
  format :json
  default_format :json


  resource :addresses do

  	desc 'Return all the Addresses'
  	get do
  	  result = Addr::GetAddresses.call
      error!(result.error, :not_found) if result.failure?
      present result.addresses, with: Entities::Address
  	end


  	desc 'Return an Address'
  	params do
  	  requires :id, 
                type: Integer, 
                desc: 'Address id',
                values: (1..1_000_000)
  	end
  	route_param :id do
  	  get do
  	    result = Addr::GetAddress.call(address_id: params[:id])
  	    error!(result.error, :not_found) if result.failure?
        Entities::Address.represent(result.address)
  	  end
  	end 


  	desc 'Create an Address'
  	params do
  		requires :street, 
  				      type: String,
  				      desc: 'street name'
  		requires :city,
  				      type: String,
  				      desc: 'name of the city'
  		requires :country,
  				      type: String,
  				      desc: 'country name' 
      optional :zip,
                type: String,
                desc: 'zip code'
  	end
  	post do
  	  result = Addr::CreateAddress.call(street: params[:street],
                                        city: params[:city],
                                        country: params[:country],
                                        zip: params[:zip] )
  	  error!(result.error, :unprocessable_entity) if result.failure? 
  	end


    desc 'update an Address'
    params do
      requires :street, 
                type: String,
                desc: 'street name'
      requires :city,
                type: String,
                desc: 'name of the city'
      requires :country,
                type: String,
                desc: 'country name' 
      optional :zip,
                type: String,
                desc: 'zip code'
    end
    route_param :id do
      put do
        result = Addr::UpdateAddress.call(street: params[:street],
                                          city: params[:city],
                                          country: params[:country],
                                          zip: params[:zip],
                                          address_id: params[:id] )
        error!(result.error, :unprocessable_entity) if result.failure? 
      end
    end
    

    desc 'Delete an Address'
    params do
      requires :id,
                type: Integer, 
                desc: 'Address ID.',
                values: (1..1_000_000)
    end
    route_param :id do
      delete do
        result = Addr::DeleteAddress.call(address_id: params[:id])
        error!(result.error, :unprocessable_entity) if result.failure? 
      end
    end
    
    
  end
end