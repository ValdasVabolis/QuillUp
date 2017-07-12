json.extract! users_posts_comment, :id, :body, :user_id, :post_id, :created_at, :updated_at
json.url users_posts_comment_url(users_posts_comment, format: :json)
