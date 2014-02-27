class Comment < ActiveRecord::Base
  has_one :post
end
