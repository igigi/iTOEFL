# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :jinghua_answer do
    user nil
    jinghua_question nil
    content "MyString"
    is_shared "MyString"
  end
end
