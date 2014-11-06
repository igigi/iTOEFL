# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tpo_question do
    content "MyText"
    sequence_number 1
    tpo_type nil
  end
end
