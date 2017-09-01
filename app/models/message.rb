class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true

  def read!
    self.read = true
    self.save!
  end
end
