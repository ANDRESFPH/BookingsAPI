require 'rails_helper'

describe API::OrganizationApi do

  context 'GET /organizations' do
    it 'returns all the organizations' do
      get '/api/organizations'
      expect(response.status).to eq(200)
    end
  end

  context 'GET /organizations/:id' do
    let(:organization) { create(:organization) }

    it 'returns an organization by id' do
      get "/api/organizations/#{organization.id}"
      expect(response.status).to eq (200)
    end
  end

  context 'DELETE /organizations/:id' do
    let(:organization) { create(:organization) }

    it 'deletes an organization' do
      delete "/api/organizations/#{organization.id}"
      expect(response.status).to eq (200)
    end
  end

  context 'POST /organizations' do
    let(:organization) { create(:organization) }

    it 'creates an organization' do
     post '/api/organizations', organization.to_json, 'CONTENT_TYPE' => 'application/json'
      expect(response.status).to eq (201)
    end
  end

  context 'PUT /organizations/:id' do
    let(:organization) { create(:organization) }

    it 'updates an organization' do
     put "/api/organizations/#{organization.id}", organization.to_json, 'CONTENT_TYPE' => 'application/json'
      expect(response.status).to eq (200)
    end
  end

  
  
end