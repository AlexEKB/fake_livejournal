require 'rails_helper'

RSpec.feature 'USER removes profile', type: :feature do
  let(:user) { FactoryBot.create :user }

  before(:each) do
    login_as user
  end

  scenario 'remove profile' do
    visit('/users/edit')

    click_button 'Cancel my account'

    expect(page).to have_content('Bye! Your account has been successfully cancelled. We hope to see you again soon.')
    expect(page).to have_content('Зарегистрироваться')
  end
end
