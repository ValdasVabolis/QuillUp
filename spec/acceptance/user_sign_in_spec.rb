require 'rails_helper'

feature "sign in process", type: :feature, js: true do
  background do
    @user = create(:user, {
      email: 'user@example.com',
      password: 'password'
    })
  end

  scenario 'sign in to Quill' do
    visit 'users/sign_in'

    within("#new_user") do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end
    click_button 'Sign In'
    expect(page).to have_content 'Signed in successfully.'
  end
end