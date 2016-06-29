require 'rails_helper'

RSpec.describe Store, type: :model do
  describe :validations do
    specify { expect(build(:store)).to be_valid }
    specify { expect(build(:store, title: '')).not_to be_valid }
    specify { expect(build(:store, title: nil)).not_to be_valid }
    specify { expect(build(:store, opening_hours: nil)).not_to be_valid }
    specify { expect(build(:store, opening_hours: '')).not_to be_valid }
  end
end
