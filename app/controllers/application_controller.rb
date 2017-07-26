class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :users_post_path
  def users_post_path(post)
    "/users/post/#{post.id}"
  end

  helper_method :history_comment_post_link
  def history_comment_post_link(post_id)
    "/users/post/#{post_id}"
  end
end
