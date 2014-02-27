class Post < ActiveRecord::Base
  has_one :category
  has_many :comments
end
