# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :work_sample do
    standpoint "MyString"
    content "MyText"
    jijing_work nil
    user nil
  end
end
