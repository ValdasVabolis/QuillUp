require 'rails_helper'

RSpec.describe Message, type: :model do
  it 'saves when valid' do
    m = build(:message)
    expect(m.save).to be true
  end

  describe '#read' do
    it 'defaults to false' do
      m = build(:message)
      expect(m.read?).to be false
    end
  end

  describe '#read!' do
    it 'sets message as read' do
      m = build(:message)
      m.read!
      expect(m.read?).to be true
    end
  end

  describe '#user' do
    it 'is required' do
      m = build(:message, user: nil)
      expect(m.save).to be false
    end
  end

  describe '#body' do
    it 'is required' do
      m = build(:message, body: nil)
      expect(m.save).to be false
    end
  end
end
