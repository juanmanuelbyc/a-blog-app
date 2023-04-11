require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'GET /index' do
    it 'renders a successful response' do
      get user_posts_path(1)
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get user_posts_path(1)
      expect(response).to render_template('index')
    end

    it 'includes correct placeholder text' do
      get user_posts_path(1)
      expect(response.body).to include('<h3>Here is a list of posts for a given user</h3>')
    end
  end

  context 'GET /show' do
    it 'renders a successful response' do
      get user_post_url(1, 3)
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get user_post_url(1, 3)
      expect(response).to render_template('show')
    end

    it 'includes correct placeholder text' do
      get user_post_url(1, 3)
      expect(response.body).to include('<h3>Here is a post</h3>')
    end
  end
end
