require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe :validations do
    specify { expect(build(:organization)).to be_valid }
    specify { expect(build(:organization, title: '')).not_to be_valid }
    specify { expect(build(:organization, title: nil)).not_to be_valid }
    specify { expect(build(:organization, org_type: nil)).not_to be_valid }
    specify { expect(build(:organization, description: nil)).not_to be_valid }
  end
end
