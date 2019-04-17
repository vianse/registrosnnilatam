json.extract! event, :id, :name, :description, :message, :urlTolink, :active, :position, :userID, :created_at, :updated_at
json.url event_url(event, format: :json)
