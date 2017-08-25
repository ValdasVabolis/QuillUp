module UserHelper
  def user_score_sum(user, type)
    user.send("#{type}s").map(&:score).sum
  end

  def user_about_me(user)
    if user.about.nil?
      render html: '<h2>About me</h2><p>User does not have an about me yet.</p>'.html_safe
    else
      render html: "<h2>About me</h2><p>#{user.about}</p>".html_safe
    end
  end
end
