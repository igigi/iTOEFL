# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article_judgement do
    score 1
    article_mark nil
    user nil
  end
end
