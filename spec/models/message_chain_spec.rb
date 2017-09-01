require 'rails_helper'

RSpec.describe MessageChain, type: :model do
  subject { create(:message_chain) }
  
  it 'saves when valid' do
    expect(build(:message_chain).save).to be true
  end



  describe 'title' do
    it 'is required' do
      subject.title = nil
      expect(subject.save).to be false
    end
  end



  describe '#user' do
    it 'is required' do
      subject.user = nil
      expect(subject.save).to be false
    end
  end



  describe '#messages' do
    it 'can be empty' do
      subject.messages = []
      expect(subject.save).to be true
    end

    it 'can have messages' do
      3.times do
        subject.messages << build(:message)
      end
      expect(subject.save).to be true
    end
  end



  describe '#user' do
    it 'is required' do
      subject.user = nil
      expect(subject.save).to be false
    end
  end
end
