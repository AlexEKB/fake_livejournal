require 'rails_helper'

RSpec.describe 'USER creates comment', type: :feature do
  let(:user) { FactoryBot.create :user }
  let(:post) { FactoryBot.create :post, user: user }
  Post.__elasticsearch__.create_index!
  Post.__elasticsearch__.refresh_index!

  before do
    login_as user
  end

  it 'create comment' do
    visit(post_path(post))

    fill_in('comment[body]', with: 'Хороший коммент')
    click_button 'Отправить'

    expect(page).to have_content('Комментарий успешно создан.')
    expect(page).to have_content('Хороший коммент')
  end
end
