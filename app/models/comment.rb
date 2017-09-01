require 'with_friendly_date_time'

class Comment < ApplicationRecord
  include WithFriendlyDateTime

  acts_as_votable

	belongs_to :answer
  belongs_to :user

  validates :body, presence: true, length: { minimum: 1, maximum: 1000 }

  def vote_path(type)
    "users/questions/answer/comment/#{self.id}/vote/#{type}"
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
  
end
