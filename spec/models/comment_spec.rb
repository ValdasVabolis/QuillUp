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
  subject { create(:comment) }

  it 'saves when valid' do
    expect(build(:comment).save).to be true
  end



  describe '#user' do
    it 'is required' do
      subject.user = nil
      expect(subject.save).to be false
    end
  end



  describe '#answer' do
    it 'is required' do
      subject.answer = nil
      expect(subject.save).to be false
    end
  end



  describe '#body' do
    it 'is required' do
      subject.body = ''
      expect(subject.save).to be false
    end
  end



  # describe '#friendly_date' do
  #   before(:each) do
  #     time = DateTime.new(2000, 1, 1)
  #     Timecop.travel(time)
  #   end

  #   after(:each) do
  #     Timecop.return
  #   end

  #   it 'is formatted correctly' do
  #     expect(subject.friendly_date).to eq 'Jan 1, 2000'
  #   end
  # end



  # describe '#friendly_time' do
  #   before(:each) do
  #     time = DateTime.new(2000, 1, 1)
  #     Timecop.freeze(time)
  #   end

  #   after(:each) do
  #     Timecop.return
  #   end

  #   it 'is formatted correctly' do
  #     expect(subject.friendly_time).to eq '12:00 AM'
  #   end
  # end
end
