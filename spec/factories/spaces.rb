FactoryGirl.define do
  factory :space do
  	title { 'outer space' }
    price_per_day { 100 }
    price_per_week {500}
    price_per_month {1700}
    association :store, factory: :store
  end
end
