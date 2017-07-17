# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment_id :integer
#

class Comment < ApplicationRecord
  acts_as_votable

  belongs_to :user
  belongs_to :post
  
  validates :body, presence: true
  validate :user_account_confirmed, if: :user

  def score
    self.votes_for.up.size - self.votes_for.down.size
  end



  private

  def user_account_confirmed
    unless self.user.confirmed?
      errors.add(:user, 'must be confirmed')
    end
  end
end
