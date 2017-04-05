FactoryGirl.define do
  factory :product, class: 'Kms::Product' do
    sequence(:name) { |n| "Product " + n.to_s }
  end
end
