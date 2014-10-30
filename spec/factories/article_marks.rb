# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article_mark do
    user nil
    article nil
    score "MyString"
  end
end
