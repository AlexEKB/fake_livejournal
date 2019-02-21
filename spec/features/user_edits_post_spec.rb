require 'rails_helper'

RSpec.feature 'USER edits post', type: :feature do
  let(:user) { FactoryBot.create :user }
  let(:post) { FactoryBot.create :post, user: user }

  before(:each) do
    login_as user
  end

  scenario 'edit post' do
    visit(edit_post_path(post))

    fill_in("post[title]", with: 'Обновленный пост')
    fill_in("post[text]", with: 'Редактированный текст.')
    click_button 'Запостить'

    expect(page).to have_content('Post was successfully updated.')
    expect(page).to have_content('Обновленный пост')
    expect(page).to have_content('Редактированный текст.')
  end
end
