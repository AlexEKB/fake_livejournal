require 'rails_helper'

RSpec.describe 'USER edits profile', type: :feature do
  let(:user) { FactoryBot.create :user }

  before do
    login_as user
  end

  it 'edit profile' do
    visit(edit_user_path(user))
    fill_in('Email', with: 'user1@mail.com')
    click_button 'Сохранить'

    expect(page).to have_content('User was successfully updated.')
    expect(page).to have_content('user1@mail.com')
  end
end
