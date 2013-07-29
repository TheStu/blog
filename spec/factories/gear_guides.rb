# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gear_guide do
    user_id 1
    title "MyString"
    content "MyText"
    meta_description "MyString"
  end
end
