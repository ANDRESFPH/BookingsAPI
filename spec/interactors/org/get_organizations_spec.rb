describe Org::GetOrganizations, type: :interactor do

  describe '#call' do
    subject { described_class.call }

    context 'get organization' do

      it 'is a success ' do
        expect(subject).to be_a_success
      end

      it 'is a success ' do
        expect(subject.organizations).to be_a ActiveRecord::Relation
      end
    end  
  end
end