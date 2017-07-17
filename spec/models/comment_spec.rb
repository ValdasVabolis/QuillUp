require 'rails_helper'

describe Comment do
  it "saves when valid" do
    c = build(:comment)
    expect(c.save).to be true
  end

  describe '#user' do
    it 'is required' do
      c = build(:comment, user: nil)
      expect(c.save).to be false
    end

    it 'must have confirmed account' do
      u = build(:user, confirmed_at: nil)
      c = build(:comment, user: u)
      expect(c.save).to be false
    end
  end
end