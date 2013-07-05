json.array!(@categories) do |category|
  json.extract! category, :name, :tagged_posts
  json.url category_url(category, format: :json)
end
