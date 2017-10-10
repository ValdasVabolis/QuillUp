module UserHelper
  def user_score_sum(user, type)
    user.send("#{type}s").map(&:score).sum
  end

  def user_score_sum_all(user)
    %i[question answer comment].map do |t|
      user_score_sum(user, t)
    end.sum
  end

  def user_about_me(user)
    if user.about.nil?
      render html: "<h4>#{t(:about_me)}</h4><p>User does not have an about me yet.</p>".html_safe
    else
      render html: "<h4>#{t(:about_me)}<p>#{user.about}</p>".html_safe
    end
  end
end
