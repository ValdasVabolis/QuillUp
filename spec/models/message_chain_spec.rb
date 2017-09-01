require 'rails_helper'

RSpec.describe MessageChain, type: :model do
  it 'saves when valid' do
    mc = build(:message_chain)
    expect(mc.save).to be true
  end
  describe 'title' do
    it 'is required' do
      mc = build(:message_chain, title: nil)
      expect(mc.save).to be false
    end
  end
  describe '#user' do
    it 'is required' do
      mc = build(:message_chain, user: nil)
      expect(mc.save).to be false
    end
  end
end
