# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :w_answer do
    tpo_question nil
    user nil
    standpoint "MyString"
    content "MyText"
  end
end
