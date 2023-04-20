require 'rails_helper'
RSpec.describe 'Post show page', type: :feature do
  before do
    visit user_post_path(1, 1)
  end

  describe 'Page content' do
    it "should display post's title" do
      expect(page).to have_content(Post.find_by_id(1).title)
    end
    it "should display user's name" do
      expect(page).to have_content(User.find_by_id(1).name)
    end
    it 'should display post body' do
      expect(page).to have_content(Post.find_by_id(1).text)
    end
    it 'should display the username of each commentor' do
      expect(page).to have_content(Comment.find_by_id(1).author.name)
    end
    it 'should display the comments each commentor left' do
      expect(page).to have_content(Comment.find_by_id(1).text)
    end
    it 'should display comment counts for each post' do
      expect(page).to have_content('Comments: 1')
    end
    it 'should display total likes for a post' do
      expect(page).to have_content('Likes: 1')
    end
  end
end
