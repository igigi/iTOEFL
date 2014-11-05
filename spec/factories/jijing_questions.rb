# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :jijing_question do
    sequence_number "MyString"
    jijing_task nil
    content "MyText"
  end
end
