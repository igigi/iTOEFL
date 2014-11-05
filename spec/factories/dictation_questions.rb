# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dictation_question do
    audio_url "MyString"
    sample "MyText"
    dictation_group nil
  end
end
