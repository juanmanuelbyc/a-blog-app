require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.new(name: 'Test User',
                     photo: 'test photo link',
                     bio: 'Testing Tool',
                     posts_counter: 18)
    @post = Post.new(author: @user,
                     title: 'Hello',
                     text: 'Some text',
                     comments_counter: 2,
                     likes_counter: 3)
  end

  context 'testing method for Like model' do
    it 'should check for likes counter increased by 1' do
      @like1 = Like.create(post: @post, author: @user)
      @like2 = Like.create(post: @post, author: @user)

      to_check = @post.likes_counter
      expect(to_check).to eq 5
      @like1.destroy
      @like2.destroy
    end
  end
end
