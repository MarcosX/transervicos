json.array!(@services) do |service|
  json.extract! service, :id, :area, :subarea, :name, :description, :phone
  json.url service_url(service, format: :json)
end
