require 'rails_helper'

describe API::AddressApi do

  context 'GET /addresses' do
    it 'returns all the Addresses' do
      get '/api/addresses'
      expect(response.status).to eq(200)
    end
  end

  context 'GET /addresses/:id' do
    let(:address) { create(:address) }

    it 'returns an address by id' do
      get "/api/addresses/#{address.id}"
      expect(response.status).to eq (200)
    end
  end

  context 'DELETE /addresses/:id' do
    let(:address) { create(:address) }

    it 'deletes an address' do
      delete "/api/addresses/#{address.id}"
      expect(response.status).to eq (200)
    end
  end

  context 'POST /addresses' do
    let(:address) { create(:address) }

    it 'creates an address' do
     post '/api/addresses', address.to_json, 'CONTENT_TYPE' => 'application/json'
      expect(response.status).to eq (201)
    end
  end

  context 'PUT /addresses/:id' do
    let(:address) { create(:address) }

    it 'updates an address' do
     put "/api/addresses/#{address.id}", addresss.to_json, 'CONTENT_TYPE' => 'application/json'
      expect(response.status).to eq (200)
    end
  end

  
  
end