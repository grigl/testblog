# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  author       :string(255)
#  comment_body :text
#  post_rating  :integer
#  created_at   :datetime
#  updated_at   :datetime
#  post_id      :integer
#

class Comment < ActiveRecord::Base
  belongs_to :post

  # callbacks
  after_save :update_post_rating
  after_create :update_post_comments_count
  after_destroy :update_post_comments_count

  def update_post_rating
    self.post.update_rating if self.post_rating_changed?
  end

  def update_post_comments_count
    self.post.update_comments_count
  end
end
