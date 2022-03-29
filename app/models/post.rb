class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user

  def update_posts_counter
    user.update(posts_counter: user.posts.count)
  end

  def last_five_comments
    comments.last(5)
  end
end
