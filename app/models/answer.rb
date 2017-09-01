require 'with_friendly_date_time'

# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  body        :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted     :boolean          default(FALSE)
#  question_id :integer
#
class Answer < ApplicationRecord
  include WithFriendlyDateTime

  acts_as_votable

  belongs_to :user
  belongs_to :question
  has_many :comments
  validates :body, presence: true, length: { minimum: 1, maximum: 5000 }
  validate :user_account_confirmed, if: :user

  def vote_path(type)
    "/users/questions/answer/#{self.id}/vote/#{type}"
  end

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
