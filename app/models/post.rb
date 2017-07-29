# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  acts_as_votable
  belongs_to :user

  has_many :comments, dependent: :destroy

  validates_presence_of :user

  def score
    self.votes_for.up.size - self.votes_for.down.size
  end
end