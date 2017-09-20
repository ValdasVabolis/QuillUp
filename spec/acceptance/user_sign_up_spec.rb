require 'rails_helper'
feature "sign in process", type: :feature, js: true do
  background do
    @user = build(:user)
  end

  scenario 'user registration' do
    visit root_path

    click_link 'Sign Up'

    within("#new_user") do
      fill_in 'Username', with: @user.username
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Confirm Password', with: @user.password_confirmation
    end

    click_button 'Sign Up'

    expect(page).to have_content 'A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.'

    registered_user = User.find_by_email(@user.email)

    visit "users/confirmation?confirmation_token=#{registered_user.confirmation_token}"

    expect(page).to have_content 'Your email address has been successfully confirmed.'
  end
end
