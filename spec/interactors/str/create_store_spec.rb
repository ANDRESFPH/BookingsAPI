describe Str::CreateStore, type: :interactor do

  let(:store) { create(:store) }

  def store_params
      {
        title: store.title,
        opening_hours: store.opening_hours,
        address_id: store.address,
        organization_id: store.organization
      }
  end

  describe '#call' do
    subject { described_class.call(store_params) }

    context 'creates a store' do

      it 'is a success ' do
        expect(subject).to  be_a_success
      end
    end  
  end
end