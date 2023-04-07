class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :author, class_name: 'User'
  after_save :increase_posts_counter
    
  private

  def increase_posts_counter
    author.increment!(:posts_counter)
  end
end