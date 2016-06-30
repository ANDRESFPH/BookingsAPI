class API::StoreApi < Grape::API

  #Api Format, configures the format to json
  format :json
  default_format :json


  resource :spaces do

  	desc 'Return all the Spaces'
  	get do
  	  result = Spaces::GetSpaces.call
      error!(result.error, :not_found) if result.failure?
      present result.spaces, with: Entities::Space
  	end


  	desc 'Return a Space'
  	params do
  	  requires :id, 
                type: Integer, 
                desc: 'Store id',
                values: (1..1_000_000)
  	end
  	route_param :id do
  	  get do
  	    result = Spaces::GetSpace.call(space_id: params[:id])
  	    error!(result.error, :not_found) if result.failure?
        Entities::Space.represent(result.store)
  	  end
  	end 


  	desc 'Create a Space'
  	params do
  		requires :title, 
  				      type: String,
  				      desc: 'title of the space'
  		requires :price_per_day,
  				      type: Decimal,
  				      desc: 'price per day'
      requires :price_per_week,
                type: Decimal,
                desc: 'price per week'
      requires :price_per_month,
                type: Decimal,
                desc: 'price per month'
      requires :store_id,
                type: Integer,
                desc: 'id of the store'
  	end
  	post do
  	  result = Spaces::CreateSpace.call(title: params[:title],
                                        price_per_day: params[:price_per_day],
                                        price_per_week: params[:price_per_week],
                                        price_per_month: params[:price_per_month],
                                        space_id: params[:space_id] )
  	  error!(result.error, :unprocessable_entity) if result.failure? 
  	end


    desc 'update a Store'
    params do
      requires :title, 
                type: String,
                desc: 'title of the space'
      requires :price_per_day,
                type: Decimal,
                desc: 'price per day'
      requires :price_per_week,
                type: Decimal,
                desc: 'price per week'
      requires :price_per_month,
                type: Decimal,
                desc: 'price per month'
      requires :store_id,
                type: Integer,
                desc: 'id of the store'
    end
    route_param :id do
      put do
        result = Spaces::UpdateSpace.call(title: params[:title],
                                          price_per_day: params[:price_per_day],
                                          price_per_week: params[:price_per_week],
                                          price_per_month: params[:price_per_month],
                                          space_id: params[:space_id] )
        error!(result.error, :unprocessable_entity) if result.failure? 
      end
    end
    

    desc 'Delete a Space'
    params do
      requires :id,
                type: Integer, 
                desc: 'Address ID.',
                values: (1..1_000_000)
    end
    route_param :id do
      delete do
        result = Spaces::DeleteSpace.call(space_id: params[:id])
        error!(result.error, :unprocessable_entity) if result.failure? 
      end
    end
    
    
  end
end