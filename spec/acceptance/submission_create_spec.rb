require 'rails_helper'

feature 'submission create process', type: :feature, js: true do
  background do
    @user = create(:user, {
      username: 'SeanKennedy',
      email: 'user@example.com',
      password: 'password'
    })
  end

  scenario 'create submissions q/a/c' do
    visit 'users/sign_in'

    within '#new_user' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
    end

    click_button 'Sign In'

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

    click_link 'Answers'

    within '.form_answer' do
      fill_in 'area-answer-new', with: 'I recommend starting from the basics. You need to make sure you understand the basic principles and fundamentals first,
      then all you need to do is just practice a lot and you should be well on your way of success. Good luck!'
    end

    click_button 'Create Answer'

    within '.question-author' do
      # TODO: check if question exists in user's column and if that question with id exists in DOM
      #a = page.find(:css, 'question-answer answer[data-id="' + @user.answers.last.id.to_s + '"]')
      expect(page).to have_content @user.username
    end

    click_link 'Reply to this answer'

    within ".question-answer" do
      fill_in 'reply-area', with: 'I agree with everything you have said, but there is one small problem: too much practice can cause a burn out. Make sure
      to take a rest every hour or so and drink a lot of water. It should drastically improve your learning experience.'

      click_button 'Create'
    end

    within '.comment-author' do
      # TODO: the same improvement as planned for answers ( check the comment in DB and then in DOM by ID)
      expect(page).to have_content @user.username
    end

  end
end



