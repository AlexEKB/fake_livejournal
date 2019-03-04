require 'rails_helper'

RSpec.describe 'USER edits post', type: :feature do
  let(:user) { FactoryBot.create :user }
  let(:post) { FactoryBot.create :post, user: user }

  before do
    login_as user
  end

  it 'edit post' do
    visit(edit_post_path(post))

    fill_in('post[title]', with: 'Обновленный пост')
    fill_in('post[text]', with: 'Редактированный текст.')
    click_button 'Запостить'

    expect(page).to have_content('Post was successfully updated.')
    expect(page).to have_content('Обновленный пост')
    expect(page).to have_content('Редактированный текст.')
  end

  it 'not update post' do
    visit(edit_post_path(post))

    fill_in('post[title]', with: '')
    fill_in('post[text]', with: '')
    click_button 'Запостить'

    expect(page).to have_content('Post could not be updated.')
    expect(page).to have_content('В вашей форме2 ошибок')
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Text can't be blank")
  end
end
