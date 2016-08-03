json.extract! event, :id, :title, :content, :created_at, :updated_at
json.url event_url(event, format: :json)