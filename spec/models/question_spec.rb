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



  describe '#pin' do
    it 'defaults to false' do
      expect(subject.pin).to be false
    end
  end



  describe '#pin?' do
    it 'returned pin value' do
      subject.pin = true
      subject.save
      expect(subject.pin?).to be true
    end
  end



  describe '#pin!' do
    it 'sets pin value to true' do
      expect {
        subject.pin!
      }.to change {
        subject.pin
      }.from(false).to(true)
    end
  end



  describe '#pinned' do
    it 'returns only questions with pin: true' do
      [true, false].each do |bool|
        3.times { create(:question, pin: bool) }
      end
      vals = Question.pinned.map(&:pin)
      expect(vals).not_to be_empty
      expect(vals.include? false).to be false
    end
  end



  describe '#not_pinned' do
    it 'returns only quesions with pin: false' do
      [true, false].each do |bool|
        3.times { create(:question, pin: bool) }
      end
      vals = Question.not_pinned.map(&:pin)
      expect(vals).not_to be_empty
      expect(vals.include? true).to be false
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
