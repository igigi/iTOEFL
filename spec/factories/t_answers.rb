# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :t_answer do
    tpo_question nil
    user nil
    content "MyString"
    is_shared "MyString"
    status "MyString"
  end
end
