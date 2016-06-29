describe Org::UpdateOrganization, type: :interactor do

  let(:organization) { create(:organization) }

  def organization_params
      {
        organization_id: organization.id,
        title: "something else",
        description: organization.description,
        org_type: organization.org_type
      }
  end


  describe '#call' do
    subject { described_class.call(organization_params) }

    context 'updates an organization' do

      it 'is a success ' do
        expect(subject).to  be_a_success
      end
    end  
  end
end