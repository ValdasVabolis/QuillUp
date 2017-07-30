# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Post do

  it 'saves when user logged in' do
    p = build(:post)
    expect(p.save).to be true
  end

  describe '#user' do
    it 'can not be blank' do
      post = build(:post, user: nil)
      expect(post.save).to be false
    end
  end



  describe '#friendly_date' do
    before(:each) do
      @year, @month, @day, @hour, @min = 2000, 1, 1, 12, 0
      local = Time.local(@year, @month, @day, @hour, @min)
      Timecop.freeze(local)
    end

    after(:each) do
      Timecop.return
    end

    it 'is formatted correctly' do
      p = create(:post)
      expect(p.friendly_date).to eq 'Jan 1, 2000'
    end
  end



  describe '#friendly_time' do
    before(:each) do
      @year, @month, @day, @hour, @min = 2000, 1, 1, 6, 0
      local = Time.local(@year, @month, @day, @hour, @min)
      Timecop.freeze(local)
    end

    after(:each) do
      Timecop.return
    end

    it 'is formatted correctly' do
      p = create(:post)
      expect(p.friendly_time).to eq '12:00 PM'
    end
  end
end
