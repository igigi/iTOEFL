# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dictation_result do
    content "MyText"
    dictation_question nil
    user nil
  end
end
