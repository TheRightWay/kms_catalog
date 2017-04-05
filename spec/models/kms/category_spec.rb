require 'spec_helper'

module Kms
  describe Category, type: :model do
    it { should have_and_belong_to_many(:products) }

    describe '#set_position' do
      it 'sets next position on create' do
        category1 = FactoryGirl.create(:category)
        category2 = FactoryGirl.create(:category)
        expect(category2.position).to be_eql(category1.position + 1)
      end
    end

  end
end
