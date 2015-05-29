json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :practise_area
  json.url profile_url(profile, format: :json)
end
