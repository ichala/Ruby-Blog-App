class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', counter_cache: :postsCounter
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentsCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likesCounter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def all_comments
    comments.order(created_at: :desc)
  end

  def update_posts_counter
    author.increment!(:postsCounter)
  end
end
