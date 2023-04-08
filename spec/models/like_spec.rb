require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:each) do

    @user = User.new(name: 'Test User',
                        photo: 'test photo link',
                        bio: 'Testing Tool')
    @user.save                   
    @post = Post.new(author: @user,
                        title: 'Hello',
                        text: 'Some text',
                        comments_counter: 2)
    @post.save
  end

  context 'testing method for Like model' do
    it 'should check for likes counter increased by 1' do
      Like.create(post: @post, author: @user)
      Like.create(post: @post, author: @user)

      to_check = @post.likes_counter
      expect(to_check).to eq 2
    end
    Post.delete_all
  end
end
