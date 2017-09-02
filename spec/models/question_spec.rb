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
  subject { create(:question) }

  it 'saves when valid' do
    expect(build(:question).save).to be true
  end

  describe '#user' do
    it 'can not be blank' do
      subject.user = nil
      expect(subject.save).to be false
    end
  end



  describe '#answers' do
    it 'can be empty' do
      subject.answers = []
      expect(subject.save).to be true
    end

    it 'can contain answers' do
      3.times do
        subject.answers << build(:answer)
      end
      expect(subject.save).to be true
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
      expect(subject.friendly_date).to eq 'Jan 1, 2000'
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
      expect(subject.friendly_time).to eq '12:00 AM'
    end
  end
end
