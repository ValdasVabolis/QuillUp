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
  it 'saves when valid' do
    i = build(:inquiry)
    expect(i.save).to be true
  end



  describe '#name' do
    it 'is required' do
      i = build(:inquiry, name: '')
      expect(i.save).to be false 
    end
  end



  describe '#email' do
    it 'is required' do
      i = build(:inquiry, email: '')
      expect(i.save).to be false 
    end
  end



  describe '#message' do
    it 'is required' do
      i = build(:inquiry, message: '')
      expect(i.save).to be false 
    end
  end
end
