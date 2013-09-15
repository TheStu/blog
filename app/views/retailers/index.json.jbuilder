json.array!(@retailers) do |retailer|
  json.extract! retailer, :name, :url, :what_i_say, :what_they_say, :cottage_industry
  json.url retailer_url(retailer, format: :json)
end
