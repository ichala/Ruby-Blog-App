class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', counter_cache: :postsCounter
  has_many :likes
  has_many :comments

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_posts_counter
    author.increment!(:postsCounter)
  end
end
