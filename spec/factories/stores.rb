FactoryGirl.define do
  factory :store do
  	title { 'Elm street' }
    opening_hours { '9 am - 5 pm' }
    association :address, factory: :address
    association :organization, factory: :organization   
  end
end
