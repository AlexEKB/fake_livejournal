require 'rails_helper'

RSpec.describe 'USER removes profile', type: :feature do
  let(:user) { FactoryBot.create :user }

  before do
    login_as user
  end

  it 'remove profile' do
    visit('/users/edit')

    click_button 'Cancel my account'

    expect(page).to have_content('До свидания! Ваша учетная запись удалена. Надеемся снова увидеть вас.')
    expect(page).to have_content('Зарегистрироваться')
  end
end
