class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :author, class_name: 'User'
  after_save :increase_posts_counter
  after_destroy :decrement_posts_counter

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, presence: true,
                               numericality: {
                                 only_integer: true, greater_than_or_equal_to: 0
                               }
  validates :likes_counter, presence: true,
                            numericality: {
                              only_integer: true, greater_than_or_equal_to: 0
                            }

  def most_recent_comments
    comments.order('created_at desc').limit(5)
  end

  private

  def increase_posts_counter
    author.increment!(:posts_counter)
  end

  def decrement_posts_counter
    author.decrement!(:posts_counter)
  end
end
