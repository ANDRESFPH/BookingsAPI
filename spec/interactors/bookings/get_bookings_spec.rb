describe Bookings::GetBookings, type: :interactor do

  describe '#call' do
    subject { described_class.call }

    context 'get bookings' do

      it 'is a success ' do
        expect(subject).to be_a_success
      end

      it 'is a success ' do
        expect(subject.bookings).to be_a ActiveRecord::Relation
      end
    end  
  end
end