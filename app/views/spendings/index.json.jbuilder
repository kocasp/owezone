json.array!(@spendings) do |spending|
  json.extract! spending, :id, :amount, :person_id
  json.url spending_url(spending, format: :json)
end
