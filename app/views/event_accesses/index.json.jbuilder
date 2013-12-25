json.array!(@event_accesses) do |event_access|
  json.extract! event_access, :id, :type, :user_id, :event_id
  json.url event_access_url(event_access, format: :json)
end
