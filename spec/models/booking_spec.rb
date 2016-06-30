require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe :validations do
    specify { expect(build(:booking)).to be_valid }
    specify { expect(build(:booking, start_date: nil)).not_to be_valid }
    specify { expect(build(:booking, end_date: nil)).not_to be_valid }
    specify { expect(build(:booking, price: nil)).not_to be_valid }
  end
end
