describe Spaces::GetSpaces, type: :interactor do

  describe '#call' do
    subject { described_class.call }

    context 'get spaces' do

      it 'is a success ' do
        expect(subject).to be_a_success
      end

      it 'is a success ' do
        expect(subject.spaces).to be_a ActiveRecord::Relation
      end
    end  
  end
end