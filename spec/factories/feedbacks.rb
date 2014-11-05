# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feedback do
    content "MyText"
    device "MyString"
    system "MyString"
    version "MyString"
    user nil
  end
end
