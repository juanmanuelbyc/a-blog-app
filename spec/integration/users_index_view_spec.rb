require 'rails_helper'

RSpec.describe 'Users', type: :feature do

  before(:example) do
    visit users_path
  end
  
  describe 'GET /users' do
    it 'I can see the username of all other users' do
      expect(page).to have_content('Juan')
      expect(page).to have_content('Pedro')
    end

    it 'I can see the profile picture for all other users' do
      expect(page).to have_css('img')
    end

    it 'I can see the number of posts each user has written' do
      expect(page).to have_content('Number of posts: 3')
      expect(page).to have_content('Number of posts: 0')
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