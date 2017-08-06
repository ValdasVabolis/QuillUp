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
  belongs_to :parent, optional: true, class_name: 'Comment', foreign_key: :comment_id
  has_many :children, class_name: 'Comment'
  validates :body, presence: true
  validate :user_account_confirmed, if: :user

  scope :top_level, -> { where(comment_id: nil) }

  def score
    self.votes_for.up.size - self.votes_for.down.size
  end

  def deleted?
    self.deleted
  end

  def soft_delete!
    self.deleted = true
    self.save
  end

  private

  def user_account_confirmed
    unless self.user.confirmed?
      errors.add(:user, 'must be confirmed')
    end
  end
end
