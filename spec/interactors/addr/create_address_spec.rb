describe Addr::CreateAddress, type: :interactor do

  let(:address) { create(:address) }

  def address_params
    	{
    	  street: address.street,
    	  city: address.city,
    	  country: address.country,
        zip: address.zip
    	}
  end

  describe '#call' do
    subject { described_class.call(address_params) }

    context 'creates an address' do

      it 'is a success ' do
        expect(subject).to  be_a_success
      end
    end  
  end
end