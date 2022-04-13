class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_save :update_post_counter

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
