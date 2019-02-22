require 'rails_helper'

RSpec.feature 'User views posts', type: :feature do
  let(:user) { FactoryBot.create :user }

  before(:each) do
    login_as user
    FactoryBot.create :post, user: user, title: 'First post'
    FactoryBot.create :post, user: user, title: 'Second post'
  end

  scenario 'renders posts titles' do
    visit(root_path)

    expect(page).to have_content('First post')
    expect(page).to have_content('Second post')
  end

  scenario 'renders posts titles in right order' do
    visit(root_path)

    expect(page).to have_content /Second post.*First post/m
  end
end
