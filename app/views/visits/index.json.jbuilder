json.array!(@visits) do |visit|
  json.extract! visit, :id, :visitor_id, :from_company, :person_to_meet, :company_to_visit
  json.url visit_url(visit, format: :json)
end
