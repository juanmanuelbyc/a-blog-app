require 'swagger_helper'

RSpec.describe 'api/comments', type: :request do

first_user = User.create(name: 'Juan',
    photo: 'https://www.citypng.com/public/uploads/preview/hd-profile-user-round-blue-icon-symbol-transparent-png-11639594354dzabzsbpuv.png',
    bio: 'Microverse student')
first_post = Post.create(title: 'Post1', text: 'This is my first post', author_id: first_user.id)
second_post = Post.create(title: 'Post3', text: 'This is my third post', author_id: first_user.id)
first_comment = Comment.create(text: 'This is my first comment', author_id: first_user.id, post_id: first_post.id)

before do
visit user_posts_path(first_user.id)
end

describe 'Page content' do

it 'can see the number of posts the user has written' do
expect(page).to have_text("Number of posts: #{first_user.posts.count}")
end

it 'should display recent comments on a post' do
expect(page).to have_content(first_comment.text)
end

it 'should display comment counts for each post' do
expect(page).to have_content("Comments: #{first_post.comments_counter}")
expect(page).to have_content("Comments: #{second_post.comments_counter}")
end
end
end
