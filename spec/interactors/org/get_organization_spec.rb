describe Org::GetOrganization, type: :interactor do

  org = Organization.create!(title: 'test', description: 'test', org_type: 'none')

  let(:organization) { create(:organization) }

  describe '#call' do
    subject { described_class.call(organization_id: organization.id) }

    context 'get organization by id' do

      it 'is a success ' do
        expect(subject).to  be_a_success
      end
    end  
  end
end