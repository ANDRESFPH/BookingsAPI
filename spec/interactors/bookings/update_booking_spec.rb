describe Bookings::UpdateBooking, type: :interactor do

  let(:booking) { create(:booking) }

  def booking_params
      {
        booking_id: booking.id,
        start_date: booking.start_date,
        end_date: booking.end_date,
        price: booking.price,
        organization_id: booking.organization,
        space_id: booking.space
      }
  end


  describe '#call' do
    subject { described_class.call(booking_params) }

    context 'updates a Booking' do

      it 'is a success ' do
        expect(subject).to  be_a_success
      end
    end  
  end
end