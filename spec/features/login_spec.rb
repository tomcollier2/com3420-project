require 'rails_helper'

describe 'Login as a user' do
  specify 'I can login as a student' do
    Student.create(email: 'student@email.com', password: 'Password123', password_confirmation: 'Password123')
    visit '/students/sign_in'
    fill_in 'Email', with: 'student@email.com'
    fill_in 'Password', with: 'Password123'
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  specify 'I can login as a tutor' do
    Tutor.create(email: 'tutor@email.com', password: 'Password123', password_confirmation: 'Password123')
    visit '/tutors/sign_in'
    fill_in 'Email', with: 'tutor@email.com'
    fill_in 'Password', with: 'Password123'
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end
end