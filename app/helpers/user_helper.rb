module UserHelper
  def user_score_sum(user, type)
    user.send("#{type}s").map(&:score).sum
  end
end
