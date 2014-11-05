# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    avatar "MyString"
    nickname "MyString"
    gender "MyString"
    grade "MyString"
    phone "MyString"
    user nil
  end
end
