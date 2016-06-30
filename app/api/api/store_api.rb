class API::StoreApi < Grape::API

  #Api Format, configures the format to json
  format :json
  default_format :json


  resource :stores do

  	desc 'Return all the Stores'
  	get do
  	  result = Str::GetStores.call
      error!(result.error, :not_found) if result.failure?
      present result.stores, with: Entities::Store
  	end


  	desc 'Return a Store'
  	params do
  	  requires :id, 
                type: Integer, 
                desc: 'Store id',
                values: (1..1_000_000)
  	end
  	route_param :id do
  	  get do
  	    result = Str::GetStore.call(store_id: params[:id])
  	    error!(result.error, :not_found) if result.failure?
        Entities::Store.represent(result.store)
  	  end
  	end 


  	desc 'Create a Store'
  	params do
  		requires :title, 
  				      type: String,
  				      desc: 'title of the store'
  		requires :opening_hours,
  				      type: String,
  				      desc: 'name of the city'
      requires :address_id,
                type: Integer,
                desc: 'address id'
      requires :organization_id,
                type: Integer,
                desc: 'id of the organization'
  	end
  	post do
  	  result = Str::CreateStore.call(title: params[:title],
                                    opening_hours: params[:opening_hours],
                                    address_id: params[:address_id],
                                    organization_id: params[:organization_id] )
  	  error!(result.error, :unprocessable_entity) if result.failure? 
  	end


    desc 'update a Store'
    params do
      requires :title, 
                type: String,
                desc: 'title of the store'
      requires :opening_hours,
                type: String,
                desc: 'name of the city'
      optional :address_id,
                type: Integer,
                desc: 'address id'
      optional :organization_id,
                type: Integer,
                desc: 'id of the organization'
    end
    route_param :id do
      put do
        result = Str::CreateStore.call(title: params[:title],
                                        opening_hours: params[:opening_hours],
                                        address_id: params[:address_id],
                                        organization_id: params[:organization_id] )
        error!(result.error, :unprocessable_entity) if result.failure? 
      end
    end
    

    desc 'Delete a Store'
    params do
      requires :id,
                type: Integer, 
                desc: 'Address ID.',
                values: (1..1_000_000)
    end
    route_param :id do
      delete do
        result = Str::DeleteStore.call(store_id: params[:id])
        error!(result.error, :unprocessable_entity) if result.failure? 
      end
    end
    
    
  end
end