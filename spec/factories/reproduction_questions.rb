# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reproduction_question do
    content "MyText"
    sequence_number "MyString"
  end
end
