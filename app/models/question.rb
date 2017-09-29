require 'with_friendly_date_time'

# == Schema Information
#
# Table name: questions
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
  include WithFriendlyDateTime

  acts_as_votable
  belongs_to :user

  has_many :answers, dependent: :destroy

  validates_presence_of :user
  validates :title, length: { minimum: 5, maximum: 200 }
  validates :body, length: { maximum: 10000 }

  scope :pinned, -> { where(pin: true) }
  scope :not_pinned, -> { where(pin: false) }

  def vote_path(type)
    "/users/question/#{self.id}/vote/#{type}"
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

  def pin!
    self.pin = true
    self.save
  end
end
