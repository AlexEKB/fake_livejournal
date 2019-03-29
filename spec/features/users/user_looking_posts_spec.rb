require 'rails_helper'

RSpec.describe 'USER is looking for posts', type: :feature do
  let(:user) { FactoryBot.create :user }

  before do
    login_as user
    FactoryBot.create :post, published: true, user: user, title: 'awesome', text: '111'
    FactoryBot.create :post, published: true, user: user, title: 'ruby', text: 'Is true awesome'
    FactoryBot.create :post, published: true, user: user, title: 'css', text: 'html'
    FactoryBot.create :post, published: false, user: user, title: 'rails', text: 'awesome'
  end

  # it 'search post' do
  #   visit(root_path)
  #
  #   fill_in('query', with: 'awesome')
  #   click_button 'Поиск'
  #   save_and_open_page
  #   expect(page).to have_content('awesome')
  #   expect(page).to have_content('ruby')
  #   expect(page).not_to have_content('Записи не найдены')
  #   expect(page).not_to have_content('css')
  #   expect(page).not_to have_content('rails')
  # end

  it 'not found post' do
    visit(root_path)

    fill_in('query', with: 'foo')
    click_button 'Поиск'

    expect(page).to have_content('awesome')
    expect(page).to have_content('ruby')
    expect(page).to have_content('css')
    expect(page).to have_content('Записи не найдены')
  end
end
