# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#

require 'rails_helper'

describe User do
  subject { create(:user) }

  it "saves when valid" do
    expect(build(:user).save).to be true
  end


  describe '#message_chains' do
    it "can be empty" do
      subject.message_chains = []
      expect(subject.save).to be true
    end

    it 'can be populated' do
      3.times do
        subject.message_chains << build(:message_chain)
      end
      expect(subject.save).to be true
    end
  end


  describe '#questions' do
    it "can be empty" do
      subject.questions = []
      expect(subject.save).to be true
    end

    it "can contain questions" do
      3.times do |i|
        subject.questions << build(:question)
      end
      expect(subject.save).to be true
    end
  end



  describe '#answers' do
    it "can be empty" do
      subject.answers = []
      expect(subject.save).to be true
    end

    it "can contain answers" do
      3.times do |i|
        subject.answers << build(:answer)
      end
      expect(subject.save).to be true
    end
  end
end
