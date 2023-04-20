require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  first_user = User.create(name: 'Juan',
                           photo: 'https://www.citypng.com/public/uploads/preview/hd-profile-user-round-blue-icon-symbol-transparent-png-11639594354dzabzsbpuv.png', bio: 'Microverse student')
  second_user = User.create(name: 'Pedro',
                            photo: 'https://www.citypng.com/public/uploads/preview/hd-profile-user-round-blue-icon-symbol-transparent-png-11639594354dzabzsbpuv.png', bio: 'Microverse student')

  before(:example) do
    visit users_path
  end

  describe 'GET /users' do
    it 'I can see the username of all other users' do
      expect(page).to have_content(first_user.name)
      expect(page).to have_content(second_user.name)
    end

    it 'I can see the profile picture for all other users' do
      expect(page).to have_css('img')
    end

    it 'I can see the number of posts each user has written' do
      expect(page).to have_content('Number of posts: 1')
    end

    context 'when I click on a user' do
      it 'username of all users' do
        User.all.each do |user|
          visit "/users/#{user.id}"
          expect(page).to have_text(user.name)
        end
      end

      it 'can see the user profile picture' do
        User.all.each do |user|
          visit "/users/#{user.id}"
          expect(page).to have_selector("img[src='#{user.photo}']")
        end
      end
    end
  end
end
