describe Str::GetStores, type: :interactor do

  describe '#call' do
    subject { described_class.call }

    context 'get stores' do

      it 'is a success ' do
        expect(subject).to be_a_success
      end

      it 'is a success ' do
        expect(subject.stores).to be_a ActiveRecord::Relation
      end
    end  
  end
end