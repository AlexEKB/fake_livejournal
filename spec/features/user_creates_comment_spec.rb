require 'rails_helper'

RSpec.feature 'USER creates comment', type: :feature do
  let(:user) { FactoryBot.create :user }
  let(:post) { FactoryBot.create :post, user: user }

  before(:each) do
    login_as user
  end

  scenario 'create comment' do
    visit(post_path(post))

    fill_in('comment[body]', with: 'Хороший коммент')
    click_button 'Отправить'

    expect(page).to have_content('Комментарий успешно создан.')
    expect(page).to have_content('Хороший коммент')
  end

  # scenario 'not create comment' do
  #   visit(post_path(post))
  #
  #   click_button 'Отправить'
  #   save_and_open_page
  #   expect(page).to have_content("Comment could not be created.")
  #   expect(page).to have_content("В вашей форме1 ошибок")
  #   expect(page).to have_content("Body can't be blank")
  # end
end
