describe Spaces::GetSpace, type: :interactor do

  let(:space) { create(:space) }

  describe '#call' do
    subject { described_class.call(space_id: space.id) }

    context 'get space by id' do

      it 'is a success ' do
        expect(subject).to  be_a_success
      end
    end  
  end
end