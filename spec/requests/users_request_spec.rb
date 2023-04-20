require 'rails_helper'

# we group together our users tests
RSpec.describe '/users', type: :request do

  first_user = User.create(name: 'Juan', photo: 'https://www.citypng.com/public/uploads/preview/hd-profile-user-round-blue-icon-symbol-transparent-png-11639594354dzabzsbpuv.png', bio: 'Microverse student')

  context 'GET /index' do
    it 'renders a successful response' do
      get users_url
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get users_url
      expect(response).to render_template('index')
    end

    it 'includes correct placeholder text' do
      get users_url
      expect(response.body).to include('<h1>List of users</h1>')
    end
  end

  context 'GET /show' do
    it 'renders a successful response' do
      get users_url(first_user.id)
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get user_url(first_user.id)
      expect(response).to render_template('show')
    end

    it 'includes correct placeholder text' do
      get user_url(first_user.id)
      expect(response.body).to include('<h1>User details</h1>')
    end
  end
end
