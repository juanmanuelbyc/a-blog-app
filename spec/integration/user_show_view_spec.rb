require 'rails_helper'

RSpec.feature 'Users Posts', type: :feature do
  first_user = User.create(name: 'Juan',
                           photo: 'https://www.citypng.com/public/uploads/preview/hd-profile-user-round-blue-icon-symbol-transparent-png-11639594354dzabzsbpuv.png',
                           bio: 'Microverse student')
  first_post = Post.create(title: 'Post1', text: 'This is my first post', author_id: first_user.id)

  before do
    visit user_path(first_user.id)
  end

  scenario 'I can see the user profile picture' do
    expect(page).to have_css('img')
  end

  scenario 'I can see the username of the user' do
    expect(page).to have_content('Juan')
  end

  scenario 'I can see the number of posts written by user' do
    expect(page).to have_content(first_user.posts_counter)
  end

  scenario 'I can see the bio of the user' do
    expect(page).to have_content(first_user.bio)
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
    click_link first_post.title
    expect(page).to have_current_path(user_post_path(first_user.id, first_post.id))
  end

  it 'click on post should redirect to show post' do
    visit "/users/#{first_user.id}"
    post = first_user.most_recent_3_posts.first
    click_on post.title
    expect(has_current_path?("/users/#{first_user.id}/posts/#{post.id}", wait: 5)).to be_truthy
  end

  describe 'Clicking to see all posts' do
    it "should redirect to user's post's index page" do
      click_link 'See all posts'
      expect(current_path).to eq user_path(first_user)
    end
  end
end
