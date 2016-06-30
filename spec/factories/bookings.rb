FactoryGirl.define do
  factory :booking do
    start_date { Date.new(2016, 07, 1) }
    end_date { Date.new(2016, 07, 2) }
    price {2700}
    association :space, factory: :space
    association :organization, factory: :organization   
  end
end
