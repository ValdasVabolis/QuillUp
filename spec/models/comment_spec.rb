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
#

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

  describe '#post' do
    it 'is required' do
      p = build(:comment, post: nil)
      expect(p.save).to be false
    end
  end

  # shouldn't this be in the post section
  describe '#body' do
    it 'is rqeuired' do
      c = build(:comment, body: nil)
      expect(c.save).to be false
    end
  end

  describe '#soft_delete!' do
    it 'sets the deleted flag to true' do
      c = create(:comment)
      expect { c.soft_delete! }.to change { c.deleted? }.from(false).to(true)
    end
  end
end
