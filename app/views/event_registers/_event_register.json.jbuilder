json.extract! event_register, :id, :firtsName, :lastName, :nickName, :email, :eventId, :created_at, :updated_at
json.url event_register_url(event_register, format: :json)
