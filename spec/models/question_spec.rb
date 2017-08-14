# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted    :boolean          default(FALSE)
#

require 'rails_helper'

describe Question do

  it 'saves when user logged in' do
    p = build(:question)
    expect(p.save).to be true
  end

  describe '#user' do
    it 'can not be blank' do
      question = build(:question, user: nil)
      expect(question.save).to be false
    end
  end



  describe '#answers' do
    before(:each) do
      @q = create(:question)
    end

    it 'can be empty' do
      @q.answers = []
      expect(@q.save).to be true
    end

    it 'can contain answers' do
      3.times do
        @q.answers << build(:answer)
      end
      expect(@q.save).to be true
    end
  end



  describe '#friendly_date' do
    before(:each) do
      time = DateTime.new(2000, 1, 1)
      Timecop.travel(time)
    end

    after(:each) do
      Timecop.return
    end

    it 'is formatted correctly' do
      p = create(:question)
      expect(p.friendly_date).to eq 'Jan 1, 2000'
    end
  end



  describe '#friendly_time' do
    before(:each) do
      time = DateTime.new(2000, 1, 1)
      Timecop.freeze(time)
    end

    after(:each) do
      Timecop.return
    end

    it 'is formatted correctly' do
      p = create(:question)
      expect(p.friendly_time).to eq '12:00 AM'
    end
  end
end
