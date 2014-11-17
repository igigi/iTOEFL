# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vocabulary_footprint do
    user nil
    sequence_number "MyString"
  end
end
