class MessageChain < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  has_many :messages
end
