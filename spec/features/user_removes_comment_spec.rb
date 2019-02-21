require 'rails_helper'
#Capybara.current_driver = :selenium
RSpec.feature 'USER removes comment', type: :feature do
  let(:user) { FactoryBot.create :user }
  let(:post) { FactoryBot.create :post, user: user }
  let(:comment) { FactoryBot.create :comment, user: user, post: post }

  before(:each) do
    login_as user
  end

  scenario 'remove comment' do
    visit(post_path(comment.post))

    all("[data-method='delete']").last.click
    #page.accept_confirm { click_link(post_comment_path(post, comment.post)) }

    expect(page).to have_content('Comment was successfully destroyed.')
    expect(page).not_to have_content("comment text1")
  end
end
