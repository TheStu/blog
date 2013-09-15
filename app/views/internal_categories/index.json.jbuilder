json.array!(@internal_categories) do |internal_category|
  json.extract! internal_category, :name
  json.url internal_category_url(internal_category, format: :json)
end
