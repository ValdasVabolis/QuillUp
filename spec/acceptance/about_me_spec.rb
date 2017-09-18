require 'rails_helper'

feature 'about me section creation', type: :feature, js: true do
  background do
    @user = create(:user, {
      username: 'SeanKennedy',
      email: 'user@example.com',
      password: 'password',
      about: 'I teach humbly, I learn proudly, I abstract... abstractly? Also, I have a cat named Gandalf.'
    })
  end

  scenario 'sign in and add about me section' do
    visit 'users/sign_in'

    within '#new_user' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end

    click_button 'Sign In'

    visit '/account/settings'

    within '.edit_user' do
      fill_in 'user_current_password', with: @user.password
      fill_in 'about-me', with: @user.about
    end

    click_button 'Update'

    expect(page).to have_content 'Your account has been updated successfully.'

    visit '/account'

    expect(page).to have_content @user.about
  end
end
