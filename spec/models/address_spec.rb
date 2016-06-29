require 'rails_helper'

RSpec.describe Address, type: :model do
  describe :validations do
    specify { expect(build(:address)).to be_valid }
    specify { expect(build(:address, street: '')).not_to be_valid }
    specify { expect(build(:address, city: nil)).not_to be_valid }
    specify { expect(build(:address, country: nil)).not_to be_valid }
    specify { expect(build(:address, street: nil)).not_to be_valid }
  end
end
