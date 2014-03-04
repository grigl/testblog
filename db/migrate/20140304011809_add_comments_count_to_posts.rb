class AddCommentsCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :comments_count, :integer
    add_index :posts, :comments_count
  end
end
