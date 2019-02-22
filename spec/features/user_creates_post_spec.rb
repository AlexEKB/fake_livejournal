require 'rails_helper'

RSpec.feature 'USER creates post', type: :feature do
  let(:user) { FactoryBot.create :user }

  before(:each) do
    login_as user
  end

  scenario 'create post' do
    visit(new_post_path)

    fill_in("post[title]", with: 'Супер пост')
    fill_in("post[text]", with: 'Интересный текст.')
    click_button 'Запостить'

    expect(page).to have_content('Post was successfully created.')
    expect(page).to have_content('Супер пост')
    expect(page).to have_content('Интересный текст.')
  end

  scenario 'not create post' do
    visit(new_post_path)

    click_button 'Запостить'

    expect(page).to have_content("Post could not be created.")
    expect(page).to have_content("В вашей форме2 ошибок")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Text can't be blank")
  end
end
