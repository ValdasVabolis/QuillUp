class Post < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_many :comments

  validates :user, presence: true

  def score
    self.votes_for.up.size - self.votes_for.down.size
  end
end
