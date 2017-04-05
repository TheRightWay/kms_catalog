require 'spec_helper'

module Kms
  describe Product, type: :model do
    it { should have_and_belong_to_many(:categories) }
    it { should have_many(:properties) }
    it { should have_many(:option_types) }
    it { should have_many(:product_option_types) }
    it { should have_many(:variants) }
    it { should have_one(:master) }

    describe '#set_position' do
      it 'sets next position on create' do
        product1 = FactoryGirl.create(:product)
        product2 = FactoryGirl.create(:product)
        expect(product2.position).to be_eql(product1.position + 1)
      end
    end

  end
end
