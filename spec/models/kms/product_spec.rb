require 'spec_helper'

module Kms
  describe Product, type: :model do
    it { should have_and_belong_to_many(:categories) }
    it { should have_many(:properties) }
    it { should have_many(:option_types) }
    it { should have_many(:product_option_types) }
    it { should have_many(:variants) }
    it { should have_one(:master) }

  end
end
