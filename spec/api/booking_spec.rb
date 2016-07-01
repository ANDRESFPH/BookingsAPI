require 'rails_helper'

describe API::BookingApi do

  context 'GET /bookings' do
    it 'returns all the organizations' do
      get '/api/bookings'
      expect(response.status).to eq(200)
    end
  end

  context 'GET /bookings/:id' do
    let(:booking) { create(:booking) }

    it 'returns a booking by id' do
      get "/api/bookings/#{booking.id}"
      expect(response.status).to eq (200)
    end
  end

  context 'DELETE /bookings/:id' do
    let(:booking) { create(:booking) }

    it 'deletes a booking' do
      delete "/api/bookings/#{booking.id}"
      expect(response.status).to eq (200)
    end
  end

  context 'POST /booking' do
    let(:booking) { create(:booking) }

    it 'creates a booking' do
     post '/api/bookings', booking.to_json, 'CONTENT_TYPE' => 'application/json'

      expect(response.status).to eq (201)
    end
  end

  context 'PUT /bookings/:id' do
    let(:booking) { create(:booking) }

    it 'updates an booking' do
     put "/api/bookings/#{booking.id}", booking.to_json, 'CONTENT_TYPE' => 'application/json'
      expect(response.status).to eq (200)
    end
  end  
  
end