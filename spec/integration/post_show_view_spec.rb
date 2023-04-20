require 'rails_helper'
RSpec.describe 'Post show page', type: :feature do
  first_user = User.create(name: 'Juan',
                           photo: 'https://www.citypng.com/public/uploads/preview/hd-profile-user-round-blue-icon-symbol-transparent-png-11639594354dzabzsbpuv.png', bio: 'Microverse student')
  first_post = Post.create(title: 'Post1', text: 'This is my first post', author_id: first_user.id)
  first_comment = Comment.create(text: 'This is my first comment', author_id: first_user.id, post_id: first_post.id)

  before do
    visit user_post_path(first_user.id, first_post.id)
  end

  describe 'Page content' do
    it "should display post's title" do
      expect(page).to have_content(first_post.title)
    end
    it "should display user's name" do
      expect(page).to have_content(first_user.name)
    end
    it 'should display post body' do
      expect(page).to have_content(first_post.text)
    end
    it 'should display the username of each commentor' do
      expect(page).to have_content(first_comment.author.name)
    end
    it 'should display the comments each commentor left' do
      expect(page).to have_content(first_comment.text)
    end
    it 'should display comment counts for each post' do
      expect(page).to have_content('Comments: 1')
    end
    it 'should display total likes for a post' do
      expect(page).to have_content('Likes: 1')
    end
  end
end
