class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :author, class_name: 'User'
  after_save :increase_posts_counter

  def most_recent_comments
    comments.order('created_at desc').limit(5)
  end

  private

  def increase_posts_counter
    author.increment!(:posts_counter)
  end
end
