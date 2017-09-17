require 'rails_helper'

feature 'question create process', type: :feature, js: true do

  background do
    @user = create(:user, {
      username: 'SeanKennedy',
      email: 'user@example.com',
      password: 'password'
    })
  end

  scenario 'sign in and create a question' do
    visit 'users/sign_in'

    within '#new_user' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end

    click_button 'Sign in'

    expect(page).to have_content 'Signed in successfully.'

    click_link 'New Question'

    expect(page).to have_content 'Title'

    within '#form-question' do
      fill_in 'question-title', with: 'What is the best way to learn Math in 21st century?'
      fill_in 'question-area', with: 'I have been learning Math using the textbooks that my university provides, however, it does not suffice.
      Are there any better ways to learn?'
    end

    click_button 'Create'

    expect(page).to have_content 'Question created succesfully!'
  end

end



