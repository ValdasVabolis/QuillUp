require 'rails_helper'

feature 'question edit process', type: :feature, js: true do
  background do
    @user = create(:user, {
      username: 'SeanKennedy',
      email: 'user@example.com',
      password: 'password'
    })
  end

  scenario 'sign in, create question, edit question' do
    visit 'users/sign_in'

    within '#new_user' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end

    click_button 'Sign In'

    click_link 'New Question'

    within '#form-question' do
      fill_in 'question-title', with: 'What is the best way to learn Math in 21st century?'
      fill_in 'question-area', with: 'I have been learning Math using the textbooks that my university provides, however, it does not suffice.
      Are there any better ways to learn?'
      click_button 'Create'
    end

    click_link 'Answers'
    click_link 'Edit'

    within '#form-question' do
      fill_in 'question-area', with: 'Actually, I decided to not learn Math. I found it to be very boring and tedious, but thanks for all the help.'
    end
    click_button 'Save'
    expect(page).to have_content 'Actually, I decided to not learn Math. I found it to be very boring and tedious, but thanks for all the help.'
  end
end
