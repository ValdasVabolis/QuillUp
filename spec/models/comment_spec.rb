# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment_id :integer

require 'rails_helper'

describe Comment do
  it 'saves when valid' do
    c = build(:comment)
    expect(c.save).to be true
  end



  describe '#user' do
    it 'is required' do
      c = build(:comment, user: nil)
      expect(c.save).to be false
    end
  end



  describe '#answer' do
    it 'is required' do
      c = build(:comment, answer: nil)
      expect(c.save).to be false
    end
  end



  describe '#body' do
    it 'is required' do
      c = build(:comment, body: '')
      expect(c.save).to be false
    end
  end
end
