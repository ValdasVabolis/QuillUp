require 'with_friendly_date_time'

class Comment < ApplicationRecord
  include WithFriendlyDateTime

	belongs_to :answer
  belongs_to :user

  validates :body, presence: true
end
