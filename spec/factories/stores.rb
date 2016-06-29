FactoryGirl.define do
  factory :store do
    let(:address) { create(:address) }
    let(:organization) { create(:organization) }

  	title { 'Elm street' }
    opening_hours { 'none' }
    address { address.id } 
    organization { organization.id }       
  end
end
