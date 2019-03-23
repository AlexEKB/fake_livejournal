require 'rails_helper'

RSpec.describe 'User draft posts', type: :feature do
  let(:user) { FactoryBot.create :user }

  before do
    login_as user
    FactoryBot.create :post, published: false, user: user, title: 'First post'
    FactoryBot.create :post, published: false, user: user, title: 'Second post'
  end

  it 'not renders posts titles' do
    visit(root_path)

    expect(page).not_to have_content('First post')
    expect(page).not_to have_content('Second post')
  end

  it 'renders posts titles in user profile' do
    visit(user_path(user))

    expect(page).to have_content('First post')
    expect(page).to have_content('Second post')
  end

  it 'renders drafts posts in right order' do
    visit(user_path(user))

    expect(page).to have_content /Черновики.*First post.*Second post/m
  end
end
