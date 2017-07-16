class Comment < ApplicationRecord
  acts_as_votable

  belongs_to :user
  belongs_to :post

  def score
    self.votes_for.up.size - self.votes_for.down.size
  end
end
