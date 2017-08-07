# == Schema Information
#
# Table name: answers
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  answer_id :integer
#

class Answer < ApplicationRecord
  acts_as_votable

  belongs_to :user
  belongs_to :post
  belongs_to :parent, optional: true, class_name: 'Answer', foreign_key: :answer_id
  has_many :children, class_name: 'Answer'
  validates :body, presence: true
  validate :user_account_confirmed, if: :user

  scope :top_level, -> { where(answer_id: nil) }

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