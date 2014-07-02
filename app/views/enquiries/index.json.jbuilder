json.array!(@enquiries) do |enquiry|
  json.extract! enquiry, :id, :name, :email, :phone, :message
  json.url enquiry_url(enquiry, format: :json)
end
