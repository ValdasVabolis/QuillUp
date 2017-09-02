require 'rails_helper'

RSpec.describe Message, type: :model do
  subject { create(:message) }
  
  it 'saves when valid' do
    expect(build(:message).save).to be true
  end

  describe '#message_chain' do
    it 'is required' do
      subject.message_chain = nil
      expect(subject.save).to be false
    end
  end

  describe '#read' do
    it 'defaults to false' do
      expect(subject.read?).to be false
    end
  end

  describe '#read!' do
    it 'sets message as read' do
      subject.read!
      expect(subject.read?).to be true
    end
  end

  describe '#user' do
    it 'is required' do
      subject.user = nil
      expect(subject.save).to be false
    end
  end

  describe '#body' do
    it 'is required' do
      subject.body = nil
      expect(subject.save).to be false
    end
  end
end
