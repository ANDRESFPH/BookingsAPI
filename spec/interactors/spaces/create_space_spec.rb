describe Spaces::CreateSpace, type: :interactor do

  let(:space) { create(:space) }

  def space_params
      {
        title: space.title,
        price_per_day: space.price_per_day,
        price_per_week: space.price_per_week,
        price_per_month: space.price_per_month,
        store_id: space.store,
        size: space.size
      }
  end

  describe '#call' do
    subject { described_class.call(space_params) }

    context 'creates a space' do

      it 'is a success ' do
        expect(subject).to  be_a_success
      end
    end  
  end
end