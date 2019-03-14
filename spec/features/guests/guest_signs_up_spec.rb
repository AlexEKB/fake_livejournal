require 'rails_helper'

RSpec.describe 'GUEST sign up', type: :feature do
  it 'open page sign up' do
    visit '/'

    click_link 'Зарегистрироваться'

    expect(page).to have_content('Sign up')
    expect(page).to have_content('email')
    expect(page).to have_content('Пароль')
    expect(page).to have_content('Подтверждение пароля')
    expect(page).to have_button('Sign up')
    expect(page).to have_content('Log in')
    expect(page).to have_content('Sign in with GoogleOauth2')
  end

  it 'create new user' do
    visit '/users/sign_up'

    fill_in('Имя', with: 'Name')
    fill_in('Фамилия', with: 'Surname')
    fill_in('email', with: 'user2@mail.ru')
    fill_in('Пароль', with: '123456')
    fill_in('Подтверждение пароля', with: '123456')
    click_button 'Sign up'

    expect(page).to have_content('Добро пожаловать! Вы успешно зарегистрировались.')
    expect(page).to have_content('Создать новый пост')
    expect(page).not_to have_content('Зарегистрироваться')
  end
end
