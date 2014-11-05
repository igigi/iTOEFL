# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reproduction_result do
    score 1
    reproduction_question nil
    user nil
  end
end
