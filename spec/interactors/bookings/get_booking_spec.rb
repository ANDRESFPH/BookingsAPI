describe Bookings::GetBooking, type: :interactor do

  let(:booking) { create(:booking) }

  describe '#call' do
    subject { described_class.call(booking_id: booking.id) }

    context 'get booking by id' do

      it 'is a success ' do
        expect(subject).to  be_a_success
      end
    end  
  end
end