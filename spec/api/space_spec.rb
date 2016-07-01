require 'rails_helper'

describe API::SpaceApi do

  context 'GET /spaces' do
    it 'returns all the spaces' do
      get '/api/spaces'
      expect(response.status).to eq(200)
    end
  end

  context 'GET /spaces/:id' do
    let(:space) { create(:space) }

    it 'returns a space by id' do
      get "/api/spaces/#{space.id}"
      expect(response.status).to eq (200)
    end
  end

  context 'DELETE /spaces/:id' do
     let(:space) { create(:space) }

    it 'deletes a space' do
      delete "/api/spaces/#{space.id}"
      expect(response.status).to eq (200)
    end
  end

  context 'POST /space' do
     let(:space) { create(:space) }

    it 'creates a space' do
     post '/api/spaces', space.to_json, 'CONTENT_TYPE' => 'application/json'

      expect(response.status).to eq (201)
    end
  end

  context 'PUT /spaces/:id' do
     let(:space) { create(:space) }

    it 'updates a space' do
     put "/api/spaces/#{space.id}", space.to_json, 'CONTENT_TYPE' => 'application/json'
      expect(response.status).to eq (200)
    end
  end

  
  
end