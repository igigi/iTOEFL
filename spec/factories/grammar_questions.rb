# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :grammar_question do
    sequence_number "MyString"
    content "MyText"
    grammar_group nil
  end
end
