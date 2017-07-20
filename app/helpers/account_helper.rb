module AccountHelper
  def users_posts
    @users_posts = current_user.posts
  end
end
