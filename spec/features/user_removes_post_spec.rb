require 'rails_helper'

RSpec.feature 'USER removes post', type: :feature do
  let(:user) { FactoryBot.create :user }
  let(:post) { FactoryBot.create :post, user: user }

  before(:each) do
    login_as user
  end

  scenario 'remove post' do
    visit(edit_post_path(post))

    click_link 'Удалить'

    expect(page).to have_content('Post was successfully destroyed.')
  end
end
