describe Spaces::UpdateSpace, type: :interactor do

  let(:space) { create(:space) }

   def space_params
      {
        space_id: space.id,
        title: 'another title',
        price_per_day: space.price_per_day,
        price_per_week: space.price_per_week,
        price_per_month: space.price_per_month,
        store_id: space.store,
        size: space.size
      }
  end


  describe '#call' do
    subject { described_class.call(space_params) }

    context 'updates a Space' do

      it 'is a success ' do
        expect(subject).to  be_a_success
      end
    end  
  end
end