# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tpo_sample do
    standpoint "MyString"
    content "MyText"
    tpo_question nil
    user nil
  end
end
