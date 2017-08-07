require 'spec_helper'
include Warden::Test::Helpers

module RequestHelpers
  def login_user(user)
    login_as user, scope: :user, run_callbacks: false
  end

  def create_logged_in_user
    user = FactoryGirl.create(:user)
    login_user(user)
    user
  end
end
