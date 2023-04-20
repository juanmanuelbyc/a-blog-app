require 'rails_helper'

RSpec.feature 'Users Posts', type: :feature do
  before do
    visit user_path(1)
  end

  scenario 'I can see the user profile picture' do
    expect(page).to have_css('img')
  end

  scenario 'I can see the username of the user' do
    expect(page).to have_content('Juan')
  end

  scenario 'I can see the number of posts written by user' do
    expect(page).to have_content(User.first.posts_counter)
  end

  scenario 'I can see the bio of the user' do
    expect(page).to have_content(User.first.bio)
  end

  scenario 'I can see the user first 3 posts' do
    expect(page).to have_content('Post1')
    expect(page).to have_content('Post3')
    expect(page).to have_content('Post4')
    expect(page).to_not have_content('Post2')
  end

  scenario 'I can see a link to see all posts' do
    expect(page).to have_link('See all posts')
  end

  scenario 'When I click a user post, it redirects me to that post show page' do
    click_link Post.first.title
    expect(page).to have_current_path(user_post_path(1, 1))
  end

  it 'click on post should redirect to show post' do
    User.all.each do |user|
      visit "/users/#{user.id}"

      post = user.most_recent_3_posts.first
      click_on post.title

      expect(has_current_path?("/users/#{user.id}/posts/#{post.id}", wait: 5)).to be_truthy
    end
  end

  describe 'Clicking to see all posts' do
    it "should redirect to user's post's index page" do
      click_link 'See all posts'
      expect(current_path).to eq user_path(1)
    end
  end
end