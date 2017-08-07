# == Schema Information
#
# Table name: answers
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  answer_id :integer


require 'rails_helper'

describe Answer do
  it "saves when valid" do
    c = build(:answer)
    expect(c.save).to be true
  end

  describe '#parent' do
    it 'can exist' do
      c = build(:answer)
      p = build(:answer)
      c.parent = p
      expect(c.save).to be true
    end
  end

  describe '#children' do
    it 'can be populated' do
      c = build(:answer)
      3.times do
        c.children << create(:answer)
      end
      expect(c.save).to be true
    end

    it 'can be empty' do
      c = build(:answer)
      c.children = []
      expect(c.save).to be true
    end

  end

  describe '#user' do
    it 'is required' do
      c = build(:answer, user: nil)
      expect(c.save).to be false
    end

    it 'must have confirmed account' do
      u = build(:user, confirmed_at: nil)
      c = build(:answer, user: u)
      expect(c.save).to be false
    end
  end

  describe '#post' do
    it 'is required' do
      p = build(:answer, post: nil)
      expect(p.save).to be false
    end
  end

  # shouldn't this be in the post section
  describe '#body' do
    it 'is required' do
      c = build(:answer, body: nil)
      expect(c.save).to be false
    end
  end

  describe '#soft_delete!' do
    it 'sets the deleted flag to true' do
      c = create(:answer)
      expect { c.soft_delete! }.to change { c.deleted? }.from(false).to(true)
    end
  end
end
