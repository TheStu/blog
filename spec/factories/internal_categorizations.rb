# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :internal_categorization do
    internal_categorization_type "MyString"
    internal_categorization_id 1
    internal_category_id 1
  end
end
