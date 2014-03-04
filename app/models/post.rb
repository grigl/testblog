# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  author         :string(255)
#  author_ip      :string(255)
#  post_body      :text
#  created_at     :datetime
#  updated_at     :datetime
#  category_id    :integer
#  rating         :float
#  comments_count :integer
#  date_added     :string(255)
#
# Indexes
#
#  index_posts_on_author          (author)
#  index_posts_on_category_id     (category_id)
#  index_posts_on_comments_count  (comments_count)
#  index_posts_on_date_added      (date_added)
#  index_posts_on_rating          (rating)
#

class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments

  # callbacks
  after_create :save_date_added

  def save_date_added
    self.update_attributes(date_added: self.created_at.strftime("%d-%m-%Y"))
  end

  def self.best_posts(qnt)
    where('rating is not null').order('rating desc').limit(qnt)
  end

  def ratings
    self.comments.pluck(:post_rating)
  end

  def float_rating
    self.rating.round(2) if self.rating
  end

  def rounded_rating
    self.rating.round if self.rating
  end

  def update_rating
    ratings = self.ratings
    ratings_sum = ratings.compact.sum
    ratings_count = ratings.length

    new_rating = ratings_sum/ratings_count.to_f if ratings_sum > 0 else nil
    self.update_attributes(rating: new_rating)
  end

  def update_comments_count
    self.update_attributes(comments_count: self.comments.length) 
  end
end
