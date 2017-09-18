require 'rails_helper'

feature 'password change process', type: :feature, js: true do
  background do
    @user = create(:user, {
      username: 'SeanKennedy',
      email: 'user@example.com',
      password: 'password'
    })
  end

  scenario 'user signs in, changes password, signs out, signs in with new password' do
    visit 'users/sign_in'

    within '#new_user' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end

    click_button 'Sign In'

    visit '/account/settings'

    within '.edit_user' do
      fill_in 'user_current_password', with: @user.password
      fill_in 'user_password', with: 'newpassword'
      fill_in 'user_password_confirmation', with: 'newpassword'
    end

    click_button 'Update'

    # TODO: fetch the updated password from database, to check if the actual db update works
    @user.password = 'newpassword'

    expect(page).to have_content 'Your account has been updated successfully.'

    click_link 'Sign Out'

    visit 'users/sign_in'

    within("#new_user") do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Sign In'
    expect(page).to have_content 'Signed in successfully.'
  end
end
