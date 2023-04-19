require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @test_user = User.new(name: 'Juan',
      photo: 'photo-link',
      bio: 'Microverse student',
      posts_counter: 0)
    @test_post = Post.new(title: 'Post1',
                             text: 'Post text',
                             author: @test_user)
  end

  context 'testing validation for Post model' do
    it 'validate title cant be empty' do
      @test_post.title = nil
      expect(@test_post).to_not be_valid
    end
  end

  context 'testing validation for Post model' do
    it 'validate title cant be greater than 250 characters' do
      @test_post.title = 'sssssssssssssssssssssssssssssssssssss
      sssssssssssssssssssssssssssssssssssssssssssssssssssssssss
      sssssssssssssssssssssssssssssssssssssssssssssssssssssssss
      sssssssssssssssssssssssssssssssssssssssssssssssssssssssss
      ssssssssssssssssssssssssssssssssssssssssssssssss'
      expect(@test_post).to_not be_valid
    end
  end

  context 'testing validation for Post model' do
    it 'validate comments counter cant be empty' do
      @test_post.comments_counter = nil
      expect(@test_post).to_not be_valid
    end
  end

  context 'testing validation for Post model' do
    it 'validate comments counter cant be negative' do
      @test_post.comments_counter = -1
      expect(@test_post).to_not be_valid
    end
  end

  context 'testing validation for Post model' do
    it 'validate likes counter cant be empty' do
      @test_post.likes_counter = nil
      expect(@test_post).to_not be_valid
    end
  end

  context 'testing validation for Post model' do
    it 'validate likes counter cant be negative' do
      @test_post.likes_counter = -1
      expect(@test_post).to_not be_valid
    end
  end

  context 'testing method for Post model' do
    it 'should have 0 comments' do
      expect(@test_post.most_recent_comments.count).to eq(0)
    end
  end
end
