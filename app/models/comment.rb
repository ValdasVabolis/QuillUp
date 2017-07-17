class Comment < ApplicationRecord
  acts_as_votable

  belongs_to :user
  belongs_to :post

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
