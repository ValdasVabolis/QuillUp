# == Schema Information
#
# Table name: inquiries
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  subject { create(:inquiry) }

  it 'saves when valid' do
    expect(build(:inquiry).save).to be true
  end

  describe '#name' do
    it 'is required' do
      subject.name = ''
      expect(subject.save).to be false 
    end
  end

  describe '#email' do
    it 'is required' do
      subject.email = ''
      expect(subject.save).to be false 
    end

    it 'has a valid format' do
      subject.email = 'a'
      expect(subject.save).to be false
    end
  end

  describe '#message' do
    it 'is required' do
      subject.message = ''
      expect(subject.save).to be false 
    end
  end
end
