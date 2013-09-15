# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :retailer do
    name "MyString"
    url "MyString"
    what_i_say "MyText"
    what_they_say "MyText"
    cottage_industry false
  end
end
