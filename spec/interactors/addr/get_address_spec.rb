describe Addr::GetAddress, type: :interactor do

  let(:address) { create(:address) }

  describe '#call' do
    subject { described_class.call(address_id: address.id) }

    context 'get address by id' do

      it 'is a success ' do
        expect(subject).to  be_a_success
      end
    end  
  end
end