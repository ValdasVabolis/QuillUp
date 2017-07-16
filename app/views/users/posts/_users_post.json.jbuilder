json.extract! users_post, :id, :title, :body, :user_id, :created_at, :updated_at
json.url users_post_url(users_post, format: :json)
