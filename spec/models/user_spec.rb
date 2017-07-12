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