require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
  before do
    visit user_posts_path(User.first.id)
  end

  describe 'Page content' do
    it "should display user's profile picture" do
      expect(page).to have_css("img[src='#{User.first.photo}']")
    end

    it "should display user's name" do
      expect(page).to have_content(User.first.name)
    end

    it 'can see the number of posts the user has written' do
      expect(page).to have_text("Number of posts: #{User.first.posts.count}")
    end

    it 'should display all post titles' do
      expect(page).to have_content('Post1')
      expect(page).to have_content('Post3')
      expect(page).to have_content('Post4')
    end

    it "should display some of posts' content" do
      expect(page).to have_content(Post.find_by_id(1).text[0..100])
      expect(page).to have_content(Post.find_by_id(3).text[0..100])
    end

    it 'should display recent comments on a post' do
      expect(page).to have_content(Comment.find_by_id(1).text)
    end

    it 'should display comment counts for each post' do
      expect(page).to have_content("Comments: #{Post.find_by_id(1).comments_counter}")
      expect(page).to have_content("Comments: #{Post.find_by_id(3).comments_counter}")
    end

    it 'sould go to the post show page when clicking on the post title' do
      click_link(Post.find_by_id(1).title)
      expect(page).to have_current_path(user_post_path(1, 1))
    end
  end
end
