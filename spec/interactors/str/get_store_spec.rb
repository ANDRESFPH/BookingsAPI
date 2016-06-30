describe Str::GetStore, type: :interactor do

  let(:store) { create(:store) }

  describe '#call' do
    subject { described_class.call(store_id: store.id) }

    context 'get store by id' do

      it 'is a success ' do
        expect(subject).to  be_a_success
      end
    end  
  end
end