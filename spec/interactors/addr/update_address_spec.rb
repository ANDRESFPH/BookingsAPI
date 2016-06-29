describe Addr::UpdateAddress, type: :interactor do

  let(:address) { create(:address) }

  def address_params
      {
        address_id: address.id,
        street: address.street,
        city: address.city,
        country: 'Kolumbien',
        zip: address.zip
      }
  end


  describe '#call' do
    subject { described_class.call(address_params) }

    context 'updates an address' do

      it 'is a success ' do
        expect(subject).to  be_a_success
      end
    end  
  end
end