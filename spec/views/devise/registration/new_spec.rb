require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  scenario 'login page' do
    visit new_user_registration_path
    expect(page).to have_content('Log in')
    expect(page).to have_field('user[email]')
    expect(page).to have_field('user[password]')
  end

  scenario 'Kind of errors' do
    visit new_user_registration_path
    find('input[name="commit"]').click
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

  scenario 'it should render a short path' do
    visit new_user_registration_path
    fill_in 'user_email', with: 'aa'
    fill_in 'user_password', with: 'aa'
    fill_in 'user_password_confirmation', with: 'aa'
    find('input[name="commit"]').click
    expect(page).to have_content('Email is invalid Password is too short (minimum is 6 characters)')
  end

  scenario 'the rigth login method' do
    visit new_user_registration_path
    fill_in 'user_email', with: 'barhvictor@gmail.com'
    fill_in 'user_password', with: 'aaaaaa'
    fill_in 'user_password_confirmation', with: 'aaaaaa'
    find('input[name="commit"]').click
  end
end
