# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :jijing_answer do
    jijing_question nil
    user nil
    content "MyString"
    is_shared "MyString"
    remark "MyString"
    status "MyString"
  end
end
