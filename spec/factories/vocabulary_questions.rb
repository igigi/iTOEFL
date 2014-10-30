# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vocabulary_question do
    sequence_number "MyString"
    content "MyText"
    vocabulary_group nil
  end
end
