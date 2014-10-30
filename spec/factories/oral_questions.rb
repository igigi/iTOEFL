# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :oral_question do
    sequence_number "MyString"
    data_url "MyString"
    original_text "MyText"
    oral_group nil
  end
end
