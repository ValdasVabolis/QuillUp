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
  it "saves when valid" do
    u = build(:user)
    expect(u.save).to be true
  end

  describe '#posts' do
    before(:each) do
      @user = build(:user)
    end

    it "can be empty" do
      @user.posts = []
      expect(@user.save).to be true
    end

    it "can contain posts" do
      10.times do |i|
        @user.posts << build(:post)
      end
      expect(@user.save).to be true
    end
  end
end