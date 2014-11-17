# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :grammar_rate do
    user nil
    rate "MyString"
    grammar_group nil
  end
end
