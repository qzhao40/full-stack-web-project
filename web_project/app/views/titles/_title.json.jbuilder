json.extract! title, :id, :body, :published_at, :user_id, :created_at, :updated_at
json.url title_url(title, format: :json)
