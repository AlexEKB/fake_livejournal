require 'rails_helper'

RSpec.describe 'GUEST sign up', type: :feature do
  it 'open page sign up' do
    visit '/'

    click_link 'Зарегистрироваться'

    expect(page).to have_content('Sign up')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_content('Password confirmation')
    expect(page).to have_button('Sign up')
    expect(page).to have_content('Log in')
    expect(page).to have_content('Sign in with GoogleOauth2')
  end

  it 'create new user' do
    visit '/users/sign_up'

    fill_in('Email', with: 'user2@mail.ru')
    fill_in('Password', with: '123456')
    fill_in('Password confirmation', with: '123456')
    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Создать новый пост')
    expect(page).not_to have_content('Зарегистрироваться')
  end
end
