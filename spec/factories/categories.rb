FactoryGirl.define do
  factory :category, class: 'Kms::Category' do
    sequence(:name) { |n| "Category " + n.to_s }
  end
end
