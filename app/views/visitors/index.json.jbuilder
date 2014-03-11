json.array!(@visitors) do |visitor|
  json.extract! visitor, :id, :name, :photo
  json.url visitor_url(visitor, format: :json)
end
