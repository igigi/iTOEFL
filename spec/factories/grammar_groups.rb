# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :grammar_group do
    sequence_number "MyString"
    group_type "MyString"
  end
end
