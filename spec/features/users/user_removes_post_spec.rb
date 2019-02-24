require 'rails_helper'

RSpec.describe 'USER removes post', type: :feature do
  let(:user) { FactoryBot.create :user }
  let(:post) { FactoryBot.create :post, user: user }

  before do
    login_as user
  end

  it 'remove post' do
    visit(edit_post_path(post))

    click_link 'Удалить'

    expect(page).to have_content('Post was successfully destroyed.')
  end
end
