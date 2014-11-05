# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :jijing_work do
    sequence_number "MyString"
    jijing_group nil
    content "MyText"
    content_type "MyString"
  end
end
