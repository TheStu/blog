json.array!(@gear_guides) do |gear_guide|
  json.extract! gear_guide, :user_id, :title, :content, :meta_description
  json.url gear_guide_url(gear_guide, format: :json)
end
