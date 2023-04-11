require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @test_user = User.create(name: 'Juan',
                             photo: 'photo-link',
                             bio: 'Microverse student',
                             posts_counter: 0)
  end

  context 'testing validation for User model' do
    it 'validate user name cant be empty' do
      @test_user.name = nil
      expect(@test_user).to_not be_valid
    end
  end

  context 'testing validation for User model' do
    it 'validate posts counter cant be different to integer' do
      @test_user.posts_counter = 'sandwich'
      expect(@test_user).to_not be_valid
    end
  end

  context 'testing validation for User model' do
    it 'validate posts counter cant be empty' do
      @test_user.posts_counter = nil
      expect(@test_user).to_not be_valid
    end
  end

  context 'testing validation for User model' do
    it 'validate posts counter cant be negative' do
      @test_user.posts_counter = -1
      expect(@test_user).to_not be_valid
    end
  end

  context 'testing method for User model' do
    it 'should have 0 posts' do
      expect(@test_user.most_recent_3_posts.count).to eq(0)
    end
  end
end
