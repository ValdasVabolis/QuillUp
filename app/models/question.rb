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
#  deleted    :boolean          default(FALSE)
#

class Question < ApplicationRecord
  acts_as_votable
  belongs_to :user

  has_many :answers, dependent: :destroy

  validates_presence_of :user

  def vote_path(type)
    "/users/questions/#{self.id}/vote/#{type}"
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

  def friendly_date
    self.created_at.to_date.strftime('%b %-m, %Y')
  end

  def friendly_time
    self.created_at.to_datetime.strftime('%-I:%M %p')
  end
end
