require 'rails_helper'

RSpec.describe 'USER removes comment', type: :feature do
  let(:user) { FactoryBot.create :user }
  let(:post) { FactoryBot.create :post, user: user }
  let(:comment) { FactoryBot.create :comment, user: user, post: post }

  before do
    login_as user
  end

  it 'remove comment' do
    visit(post_path(comment.post))

    all("[data-method='delete']").last.click

    expect(page).to have_content('Комментарий успешно удалён.')
    expect(page).not_to have_content('comment text1')
  end
end
