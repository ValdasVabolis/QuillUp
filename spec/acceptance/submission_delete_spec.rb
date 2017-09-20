require 'rails_helper'

feature 'submission delete process', type: :feature, js: true do

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

    page.accept_confirm do
      click_link 'Delete'
    end

    expect(page).to have_content 'Question deleted succesfully.'

    within '.form_answer' do
      fill_in 'area-answer-new', with: 'I recommend starting from the basics. You need to make sure you understand the basic principles and fundamentals first,
      then all you need to do is just practice a lot and you should be well on your way of success. Good luck!'
    end

    click_button 'Create'

    within '.question-answer.answer' do
      page.accept_confirm do
        click_link 'Delete'
      end
    end

    expect(page).to have_content 'Anonymous'

  end

end
