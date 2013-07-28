# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    post_id 1
    merchant_name "MyString"
    product_name "MyString"
    brand "MyString"
    retail_price "MyString"
    sale_price "MyString"
    buy_url "MyString"
  end
end
