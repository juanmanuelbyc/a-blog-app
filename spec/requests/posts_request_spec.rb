require 'rails_helper'

RSpec.describe 'Posts', type: :request do

  first_user = User.create(name: 'Juan', photo: 'https://www.citypng.com/public/uploads/preview/hd-profile-user-round-blue-icon-symbol-transparent-png-11639594354dzabzsbpuv.png', bio: 'Microverse student')
  first_post = Post.create(title: 'Post1', text: 'This is my first post', author_id: first_user.id)

  context 'GET /index' do
    it 'renders a successful response' do
      get user_posts_path(first_user.id)
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get user_posts_path(first_user.id)
      expect(response).to render_template('index')
    end

    it 'includes correct placeholder text' do
      get user_posts_path(first_user.id)
      expect(response.body).to include('<h1>List of posts for user</h1>')
    end
  end

  context 'GET /show' do
    it 'renders a successful response' do
      get user_post_url(first_user.id, first_post.id)
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get user_post_url(first_user.id, first_post.id)
      expect(response).to render_template('show')
    end

    it 'includes correct placeholder text' do
      get user_post_url(first_user.id, first_post.id)
      expect(response.body).to include('<h1>Post details</h1>')
    end
  end
end
