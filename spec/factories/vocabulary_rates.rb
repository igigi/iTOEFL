# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vocabulary_rate do
    user nil
    rate "MyString"
    vocabulary_group nil
  end
end
