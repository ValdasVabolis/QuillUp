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



  describe '#messages' do
    before(:each) do
      @mc = build(:message_chain)
    end

    it 'can be empty' do
      @mc.messages = []
      expect(@mc.save).to be true
    end

    it 'can have messages' do
      3.times do
        @mc.messages << build(:message)
      end
      expect(@mc.save).to be true
    end
  end



  describe '#user' do
    it 'is required' do
      mc = build(:message_chain, user: nil)
      expect(mc.save).to be false
    end
  end
end
