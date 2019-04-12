require 'rails_helper'

RSpec.describe 'USER creates tag', type: :feature do
  let(:user) { FactoryBot.create :user }

  before do
    login_as user
    FactoryBot.create :post, published: true, user: user, title: 'post1', all_tags: 'ruby, on, rails'
    FactoryBot.create :post, published: true, user: user, title: 'post2', all_tags: 'ruby'
    FactoryBot.create :post, published: true, user: user, title: 'post3', all_tags: 'on'
    FactoryBot.create :post, published: true, user: user, title: 'post4', all_tags: 'rails'
    FactoryBot.create :post, published: false, user: user, title: 'post5', all_tags: 'ruby'
  end

  it 'create post with tags' do
    visit(new_post_path)

    fill_in('post[title]', with: 'Супер пост')
    fill_in('post[text]', with: 'Интересный текст.')
    fill_in('post[all_tags]', with: 'ruby, on, rails')
    click_button 'Создать'

    expect(page).to have_content('Пост был успешно создан.')
    expect(page).to have_content('Супер пост')
    expect(page).to have_content('Интересный текст.')
    expect(page).to have_content('ruby on rails')
  end

  it 'tag search and hide draft posts' do
    visit(post_path(Post.first))
    
    page.first(:link, 'ruby').click

    expect(page).to have_content('post1')
    expect(page).to have_content('post2')
    expect(page).not_to have_content('post5')
  end
end
