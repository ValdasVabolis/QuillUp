class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :users_post_path
  def users_post_path(post)
    "/users/post/#{post.id}"
  end
end
