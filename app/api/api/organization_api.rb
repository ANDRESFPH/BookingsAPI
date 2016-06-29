class API::OrganizationApi < Grape::API

  #Api Format, configures the format to json
  format :json
  default_format :json


  resource :organizations do

  	desc 'Return all the organizations'
  	get do
  	  result = Org::GetOrganizations.call
      error!(result.error, :not_found) if result.failure?
      present result.organizations, with: Entities::Organization
  	end


  	desc 'Return an Organization'
  	params do
  	  requires :id, 
                type: Integer, 
                desc: 'organization id',
                values: (1..1_000_000)
  	end
  	route_param :id do
  	  get do
  	    result = Org::GetOrganization.call(organization_id: params[:id])
  	    error!(result.error, :not_found) if result.failure?
        Entities::Organization.represent(result.organization)
  	  end
  	end 


  	desc 'Create an organization'
  	params do
  		requires :title, 
  				  type: String,
  				  desc: 'Title of the company'
  		requires :description,
  				  type: String,
  				  desc: 'Description of the company'
  		requires :org_type,
  				  type: String,
  				  desc: 'type of company' 
  	end
  	post do
  	  result = Org::CreateOrganization.call(title: params[:title],
                                       description: params[:description],
                                       org_type: params[:org_type] )
  	  error!(result.error, :unprocessable_entity) if result.failure? 
  	end


    desc 'update an organization'
    params do
      requires :id,
                type: Integer, 
                desc: 'Organizations ID.'
      optional :title, 
                type: String,
                desc: 'Title of the company'
      optional :description,
                type: String,
                desc: 'Description of the company'
      optional :org_type,
                type: String,
                desc: 'type of company' 
    end
    route_param :id do
      put do
        result = Org::UpdateOrganization.call(title: params[:title],
                                         description: params[:description],
                                         org_type: params[:org_type],
                                         organization_id: params[:id] )
        error!(result.error, :unprocessable_entity) if result.failure? 
      end
    end
    

    desc 'Delete an Organization'
    params do
      requires :id,
                type: Integer, 
                desc: 'Organizations ID.',
                values: (1..1_000_000)
    end
    route_param :id do
      delete do
        result = Org::DeleteOrganization.call(organization_id: params[:id])
        error!(result.error, :unprocessable_entity) if result.failure? 
      end
    end
    
    
  end
end
