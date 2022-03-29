class Comment < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  belongs_to :post

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
