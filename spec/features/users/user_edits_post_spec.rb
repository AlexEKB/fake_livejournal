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
    click_button 'Создать'

    expect(page).to have_content('Пост был успешно обновлён.')
    expect(page).to have_content('Обновленный пост')
    expect(page).to have_content('Редактированный текст.')
  end

  it 'not update post' do
    visit(edit_post_path(post))

    fill_in('post[title]', with: '')
    fill_in('post[text]', with: '')
    click_button 'Создать'

    expect(page).to have_content('Пост не может быть обновлён.')
    expect(page).to have_content('В вашей форме2 ошибок')
    expect(page).to have_content("Заголовок не может быть пустым")
    expect(page).to have_content("Текст не может быть пустым")
  end
end
