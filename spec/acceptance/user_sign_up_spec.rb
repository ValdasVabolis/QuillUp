require 'rails_helper'
feature "sign in process", type: :feature, js: true do
  

  scenario 'user registration' do
    visit 'users/sign_up'

    within("#new_user") do
      fill_in 'Username', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
    click_link 'Sign out'
    expect(page).to have_content 'Signed out successfully.'
  end
end