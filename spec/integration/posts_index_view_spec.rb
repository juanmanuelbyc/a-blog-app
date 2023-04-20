require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
  first_user = User.create(name: 'Juan',
                           photo: 'https://www.citypng.com/public/uploads/preview/hd-profile-user-round-blue-icon-symbol-transparent-png-11639594354dzabzsbpuv.png',
                           bio: 'Microverse student')
  first_post = Post.create(title: 'Post1', text: 'This is my first post', author_id: first_user.id)
  second_post = Post.create(title: 'Post3', text: 'This is my third post', author_id: first_user.id)
  first_comment = Comment.create(text: 'This is my first comment', author_id: first_user.id, post_id: first_post.id)

  before do
    visit user_posts_path(first_user.id)
  end

  describe 'Page content' do
    it "should display user's profile picture" do
      expect(page).to have_css("img[src='#{first_user.photo}']")
    end

    it "should display user's name" do
      expect(page).to have_content(first_user.name)
    end

    it 'can see the number of posts the user has written' do
      expect(page).to have_text("Number of posts: #{first_user.posts.count}")
    end

    it 'should display all post titles' do
      expect(page).to have_content('Post1')
      expect(page).to have_content('Post3')
      expect(page).to have_content('Post4')
    end

    it "should display some of posts' content" do
      expect(page).to have_content(first_post.text[0..100])
      expect(page).to have_content(second_post.text[0..100])
    end

    it 'should display recent comments on a post' do
      expect(page).to have_content(first_comment.text)
    end

    it 'should display comment counts for each post' do
      expect(page).to have_content("Comments: #{first_post.comments_counter}")
      expect(page).to have_content("Comments: #{second_post.comments_counter}")
    end

    it 'sould go to the post show page when clicking on the post title' do
      click_link(first_post.title)
      expect(page).to have_current_path(user_post_path(first_user.id, first_post.id))
    end
  end
end
