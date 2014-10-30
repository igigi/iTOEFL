# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mark_tip do
    start_index 1
    end_index 1
    audio_url "MyString"
    article_mark nil
  end
end
