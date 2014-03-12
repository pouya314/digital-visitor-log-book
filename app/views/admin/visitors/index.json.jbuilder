json.array!(@visitors) do |visitor|
  json.extract! visitor, :id, :name, :photo, :visit_time, :department, :email, :phone, :reason
  json.url visitor_url(visitor, format: :json)
end
