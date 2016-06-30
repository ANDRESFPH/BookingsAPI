require 'rails_helper'

describe API::StoreApi do

  context 'GET /stores' do
    it 'returns all the organizations' do
      get '/api/stores'
      expect(response.status).to eq(200)
    end
  end

  context 'GET /stores/:id' do
    let(:store) { create(:store) }

    it 'returns a stores by id' do
      get "/api/stores/#{store.id}"
      expect(response.status).to eq (200)
    end
  end

  context 'DELETE /stores/:id' do
    let(:store) { create(:store) }

    it 'deletes a store' do
      delete "/api/stores/#{store.id}"
      expect(response.status).to eq (200)
    end
  end

  context 'POST /store' do
    let(:store) { create(:store) }

    it 'creates a store' do
     post '/api/stores', store.to_json, 'CONTENT_TYPE' => 'application/json'

      expect(response.status).to eq (201)
    end
  end

  context 'PUT /stores/:id' do
    let(:store) { create(:store) }

    it 'updates an organization' do
     put "/api/stores/#{store.id}", store.to_json, 'CONTENT_TYPE' => 'application/json'
      expect(response.status).to eq (200)
    end
  end

  
  
end