require 'rails_helper'

RSpec.describe 'User views posts', type: :feature do
  let(:user) { FactoryBot.create :user }

  before do
    login_as user
    FactoryBot.create :post, user: user, title: 'First post'
    FactoryBot.create :post, user: user, title: 'Second post'
  end

  it 'renders posts titles' do
    visit(root_path)

    expect(page).to have_content('First post')
    expect(page).to have_content('Second post')
  end

  it 'renders posts titles in right order' do
    visit(root_path)

    expect(page).to have_content /Second post.*First post/m
  end
end
