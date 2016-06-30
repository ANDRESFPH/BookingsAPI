require 'rails_helper'

RSpec.describe Space, type: :model do
   describe :validations do
    specify { expect(build(:space)).to be_valid }
    specify { expect(build(:space, title: '')).not_to be_valid }
    specify { expect(build(:space, price_per_day: nil)).not_to be_valid }
    specify { expect(build(:space, price_per_week: nil)).not_to be_valid }
    specify { expect(build(:space, price_per_month: nil)).not_to be_valid }
    specify { expect(build(:space, size: nil)).not_to be_valid }
  end
end
