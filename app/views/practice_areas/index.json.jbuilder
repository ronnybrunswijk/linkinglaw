json.array!(@practice_areas) do |practice_area|
  json.extract! practice_area, :id, :name, :subject
  json.url practice_area_url(practice_area, format: :json)
end
