class Message < ApplicationRecord
  belongs_to :user
  belongs_to :message_chain
  validates :body, presence: true

  def read!
    self.read = true
    self.save!
  end
end
