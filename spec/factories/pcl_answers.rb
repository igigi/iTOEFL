# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pcl_answer do
    tpo_question nil
    user nil
    section_number 1
    is_correct "MyString"
    option "MyString"
  end
end
